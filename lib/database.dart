import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:newitempage/common_widgets/constants.dart';

class DatabaseServices {
  final String uid;
  DatabaseServices({this.uid});

  static final CollectionReference userDatabaseInstance =
      Firestore.instance.collection("data");
  static final CollectionReference itemsDatabaseInstance =
      Firestore.instance.collection("items");

//  static final FirebaseStorage _firebaseStorage =
//      FirebaseStorage(storageBucket: "gs://shop-work-2f412.appspot.com");
//
//  static StorageUploadTask uploadTask;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~VVVV Profile Photo VVVV~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Future<List> get allItems async {
    List itemMap;
    try {
      await itemsDatabaseInstance.document(uid).get().then((documentSnapshot) =>
      itemMap = documentSnapshot.data[Constant.items.toString()]);
    } catch (e) {
      itemMap = [
        {"Error": e.toString()}
      ];
    }
    print(itemMap);
    return itemMap;
  }}