import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_market/src/models/application_user.dart';
import 'package:farmers_market/src/models/market.dart';
import 'package:farmers_market/src/models/product.dart';
import 'package:farmers_market/src/models/vendor.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(ApplicationUser user) {
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<ApplicationUser> fetchUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => ApplicationUser.fromFirestore(snapshot.data()));
  }

  Stream<List<String>> fetchUnitTypes() {
    return _db.collection('types').doc('units').snapshots().map(
        (snapshot) => snapshot.data()['production']
            .map<String>((type) => type.toString())
            .toList());
  }

  Future<void> setProduct(Product product) {
    var options = SetOptions(merge:true);
    return _db
        .collection('products')
        .doc(product.productId)
        .set(product.toMap(),options);
  }

  Future<Product> fetchProduct(String productId){
    return _db.collection('products').doc(productId)
    .get().then((snapshot) => Product.fromFirestore(snapshot.data()));
  }

  Stream<List<Product>> fetchProductsByVendorId(String vendorId) {
    return _db
        .collection('products')
        .where('vendorId', isEqualTo: vendorId)
        .snapshots()
        .map((query) => query.docs)
        .map((snapshot) =>
            snapshot.map((doc) => Product.fromFirestore(doc.data()))
        .toList());
  }

  Stream<List<Market>> fetchUpcomingMarkets(){
    return _db
      .collection('markets')
      .where('dateEnd', isGreaterThan: DateTime.now().toIso8601String())
      .snapshots()
      .map((query) => query.docs)
      .map((snapshot) => snapshot
      .map((doc) => Market.fromFirestore(doc.data()))
      .toList());
  }

  Stream<List<Product>> fetchAvailableProducts(){
    return _db  
      .collection('products')
      .where('availableUnits', isGreaterThan: 0)
      .snapshots()
      .map((query) => query.docs)
      .map((snapshot) => snapshot.map((doc) => Product.fromFirestore(doc.data()))
      .toList());
  }

  Future<Vendor> fetchVendor(String vendorId){
    return _db
      .collection('vendors')
      .doc(vendorId)
      .get().then((snapshot) => Vendor.fromFirestore(snapshot.data()));
  }

  Future<void> setVendor(Vendor vendor){
    var options = SetOptions(merge:true);

    return _db
      .collection('vendors')
      .doc(vendor.vendorId)
      .set(vendor.toMap(),options);
  }

}
