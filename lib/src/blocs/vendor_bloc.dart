import 'dart:async';
import 'dart:io';

import 'package:farmers_market/src/models/vendor.dart';
import 'package:farmers_market/src/services/firebase_storage_service.dart';
import 'package:farmers_market/src/services/firestore_service.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:uuid/uuid.dart';

class VendorBloc {
  final _db = FirestoreService();
  final _name = BehaviorSubject<String>();
  final _description = BehaviorSubject<String>();
  final _imageUrl = BehaviorSubject<String>();
  final _vendorId = BehaviorSubject<String>();
  final _vendorSaved = PublishSubject<bool>();
  final _vendor = BehaviorSubject<Vendor>();
  final _isUploading = BehaviorSubject<bool>();

  final _picker = ImagePicker();
  final storageService = FirebaseStorageService();
  var uuid = Uuid();

  //Getters
  Future<Vendor> fetchVendor(String userId) => _db.fetchVendor(userId);
  Stream<String> get name => _name.stream.transform(validateName);
  Stream<String> get description =>
      _description.stream.transform(validateDescription);
  Stream<String> get imageUrl => _imageUrl.stream;
  Stream<bool> get vendorSaved => _vendorSaved.stream;
  Stream<Vendor> get vendor => _vendor.stream;
  Stream<bool> get isUploading => _isUploading.stream;
  Stream<bool> get isValid => CombineLatestStream.combine2(
      name, description, (a, b) => true);

  //Setters
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeDescription => _description.sink.add;
  Function(String) get changeImageUrl => _imageUrl.sink.add;
  Function(Vendor) get changeVendor => _vendor.sink.add;
  Function(String) get changeVendorId => _vendorId.sink.add;

  //Dispose
  dispose() {
    _name.close();
    _description.close();
    _imageUrl.close();
    _vendorSaved.close();
    _vendor.close();
    _vendorId.close();
    _isUploading.close();
  }

  //Validators
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name != null) {
      if (name.length >= 3 && name.length <= 20) {
        sink.add(name.trim());
      } else {
        if (name.length < 3) {
          sink.addError('3 Character Minimum');
        } else {
          sink.addError('20 Character Maximum');
        }
      }
    }
  });

  final validateDescription = StreamTransformer<String, String>.fromHandlers(
      handleData: (description, sink) {
    if (description != null) {
      if (description.length >= 10 && description.length <= 200) {
        sink.add(description.trim());
      } else {
        if (description.length < 10) {
          sink.addError('10 Character Minimum');
        } else {
          sink.addError('200 Character Maximum');
        }
      }
    }
  });

  //Save Record
  Future<void> saveVendor() async {
    var vendor = Vendor(
        description: _description.value,
        imageUrl: _imageUrl.value,
        name: _name.value,
        vendorId: _vendorId.value);

    return _db.setVendor(vendor).then((value) {
      _vendorSaved.sink.add(true);
      changeVendor(vendor);
    }).catchError((error) => _vendorSaved.sink.add(false));
  }

  pickImage() async {
    PickedFile image;
    File croppedFile;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //Get Image From Device
      image = await _picker.getImage(source: ImageSource.gallery);

      //Upload to Firebase
      if (image != null) {
        _isUploading.sink.add(true);

        //Get Image Properties
        ImageProperties properties =
            await FlutterNativeImage.getImageProperties(image.path);

        //CropImage
        if (properties.height > properties.width) {
          var yoffset = (properties.height - properties.width) / 2;
          croppedFile = await FlutterNativeImage.cropImage(image.path, 0,
              yoffset.toInt(), properties.width, properties.width);
        } else if (properties.width > properties.height) {
          var xoffset = (properties.width - properties.height) / 2;
          croppedFile = await FlutterNativeImage.cropImage(image.path,
              xoffset.toInt(), 0, properties.height, properties.height);
        } else {
          croppedFile = File(image.path);
        }

        //Resize
        File compressedFile = await FlutterNativeImage.compressImage(
            croppedFile.path,
            quality: 100,
            targetHeight: 600,
            targetWidth: 600);

        var imageUrl =
            await storageService.uploadVendorImage(compressedFile, uuid.v4());
        changeImageUrl(imageUrl);
        _isUploading.sink.add(false);
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }
}
