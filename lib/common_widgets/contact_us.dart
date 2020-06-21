import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:newitempage/common_widgets/drawer.dart';
import 'package:newitempage/common_widgets/appbar.dart';

import 'drawer.dart';

// void main() => runApp(MaterialApp(
//   home: ProfileApp(),
// ));
class ContactUs extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    int _selectedPage = 0;
    var _appBarColor = Colors.green.shade500;
    return Scaffold(
        appBar: CommonAppBar(context),
        drawer: CommonDrawer(context),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text("Team eShop"),
                  ),

                  ListTile(
                    leading: const Icon(Icons.add_location),
                    title:  Text("Address to the eShop Office"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text("eShop@gmail.com"),
                  ),
                ]))

    );


    //               )
    //           )
    //         ]
    //     )
    // );
  }

}