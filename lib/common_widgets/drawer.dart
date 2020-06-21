//Kailash K S
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:newitempage/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

Widget CommonDrawer(BuildContext context){
  final AuthService _auth = AuthService();
  final FirebaseAuth _authenticate = FirebaseAuth.instance;
//  getCurrentUser() async {
//    final FirebaseUser user = await _authenticate.currentUser();
//    uid = user.uid;
//    return(uid);
//  }
  return Drawer(
    child: new ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Mr. Profesorson"),
          accountEmail: Text("Professorso@greendale.com"),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("images/bg.png"), fit: BoxFit.fill)),
          currentAccountPicture: GestureDetector(

            child: CircleAvatar(
              //backgroundImage: AssetImage("images/morty.png"),
            ),
          ),
        ),
        ListTile(
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 14),
          ),
          leading: new Icon(
            MdiIcons.face,
            color: Colors.black,
          ),
          onTap: () {
          },

        ),
        Divider(),
        ListTile(
          title: Text(
            "Appointments",
            style: TextStyle(fontSize: 14),
          ),
          leading: Icon(Icons.notifications, color: Colors.black),
        ),
        Divider(),
        ListTile(
          title: Text(
            "Your Orders",
            style: TextStyle(fontSize: 14),
          ),
          leading: new Icon(MdiIcons.truckDelivery, color: Colors.black),
        ),
        Divider(),
        ListTile(
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 14),
          ),
          leading: Icon(Icons.settings, color: Colors.black),
        ),
        Divider(),
        ListTile(
            title: Text(
              "Help",
              style: TextStyle(fontSize: 14),
            ),
            leading: Icon(Icons.help, color: Colors.black),
            onTap: () {
            }
        ),
        Divider(),
        ListTile(
          title: Text(
            "Contact Us",
            style: TextStyle(fontSize: 14),
          ),
          leading: new Icon(
            MdiIcons.faceAgent,
            color: Colors.black,
          ),
        ),
        Divider(),
        ListTile(
          onTap: () async {
            await _auth.signOut();
          },
          title: Text(
            "Sign Out",
            style: TextStyle(fontSize: 14),
          ),
          leading: new Icon(
            MdiIcons.logout,
            color: Colors.black,
          ),
        )

      ],
    ),
  );
}
