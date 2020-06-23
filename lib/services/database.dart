import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference info = Firestore.instance.collection('customer');
  static final FirebaseStorage _firebaseStorage =
  FirebaseStorage(storageBucket: "gs://shop-work-2f412.appspot.com");

  Future updateUserData(String name, String email, String address1, String address2) async {
    await info.document(uid).setData({
      'name': name,
      'email' : email,
      'street' : address1,
      'main_address': address2
    });
  }

  Future<List> downloadItemPhoto(String itemName) async {
    itemName = itemName.toLowerCase();
    String filePath = "images/$uid/items/$itemName";
    try {
      // await _uploadTask.isComplete;
      String result =
      await _firebaseStorage.ref().child(filePath).getDownloadURL();
      print(result);
      return [true, result];
    } catch (e) {
      print(e.toString());
      try {
        ///Nested TRY-CATCH, retries to fetch data after 5 seconds if data not found.
        await Future.delayed(Duration(seconds: 5), () {});
        String result =
        await _firebaseStorage.ref().child(filePath).getDownloadURL();
        print(result);
        return [true, result];
      } catch (e) {
        print(e.toString());
        return [false, "lib/shared/addimage.png"];
      }
    }
  }

  //get user streams
  Stream<QuerySnapshot> get user_info{
    return info.snapshots();
  }
}


