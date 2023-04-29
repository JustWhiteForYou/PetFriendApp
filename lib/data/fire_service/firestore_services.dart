import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final String uid;
  FireStoreService({required this.uid});

  final CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUserData(Map<String, dynamic> data) async {
    await _userCollection.doc(uid).set(data);
  }

  Future<DocumentSnapshot<Object?>> getUserData() async {
    final snapshot = await _userCollection.doc(uid).get();
    return snapshot;
  }

  Future<void> updateUserData(Map<String, dynamic> data) async {
    await _userCollection.doc(uid).update(data);
  }

  Future<void> deleteUserData() async {
    await _userCollection.doc(uid).delete();
  }
}
