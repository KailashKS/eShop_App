//Kailash K S
import 'package:flutter/material.dart';
import '../search.dart';

Widget CommonAppBar(BuildContext context) {
  return AppBar(
    //iconTheme: new IconThemeData(color: Colors.black),
    elevation: 0.0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
          ]
        )
      ),
    ),
    backgroundColor: Colors.green,
    title: Text("eShop"),
    centerTitle: true,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {
        showSearch(context: context, delegate: DataSearch(),);
      }),
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Icon(Icons.shopping_cart),
      ),
    ],
  );
}