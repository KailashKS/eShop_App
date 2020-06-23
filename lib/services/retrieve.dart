import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newitempage/firstscreen/login.dart';
import 'package:newitempage/common_widgets/items.dart';
import 'package:newitempage/home/itemlist.dart';
import 'package:newitempage/loading.dart';
import 'package:newitempage/model/user.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

class Retrieve extends StatelessWidget {
  static String id;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    User user = Provider.of(context);
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('customer')
            .document(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          }

          ///TODO: FIX HERE
          // var userDocument = snapshot.data;
          // Contain.name = userDocument['name'];
          // Contain.email = userDocument['email'];
          // Contain.address1 = userDocument['street'];
          // Contain.address2 = userDocument['main_address'];

          return ItemPage();
        },
      ),
    );
  }
}
