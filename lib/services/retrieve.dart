import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newitempage/firstscreen/login.dart';
import 'package:newitempage/common_widgets/items.dart';
import 'package:newitempage/home/itemlist.dart';
import 'package:newitempage/loading.dart';
import 'auth.dart';

class Retrieve extends StatelessWidget {
  static String id;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('customer').document('${MyHomePage.uid}').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Loading();
          }
          var userDocument = snapshot.data;
          Contain.name = userDocument['name'];
          Contain.email = userDocument['email'];
          Contain.address1 = userDocument['street'];
          Contain.address2 = userDocument['main_address'];

          return ItemPage();
        },
      ),
    );
  }
}