import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_market/src/models/user.dart';

class FirestoreService {
  Firestore _db = Firestore.instance;

  Future<void> addUser(User user){
    return _db.collection('users').document(user.userId).setData(user.toMap());
  }

  Future<User> fetchUser(String userId){
    return _db.collection('users').document(userId).get().then((snapshot) => User.fromFirestore(snapshot.data));
  }

  Stream<List<String>> fetchUnitTypes(){
    return _db.collection('types').document('units').snapshots()
            .map((snapshot) => snapshot.data['production']
            .map<String>((type) => type.toString()).toList());
  }
}