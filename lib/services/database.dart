import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference info = Firestore.instance.collection('customer');

  Future updateUserData(String name, String email, String address, String choice) async {
    await info.document(uid).setData({
      'name': name,
      'email' : email,
      'address' : address,
      'choice': choice
    });
  }

  //get user streams
  Stream<QuerySnapshot> get user_info{
    return info.snapshots();
  }
}