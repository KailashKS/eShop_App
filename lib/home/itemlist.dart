//Kailash K S
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newitempage/common_widgets/appbar.dart';
import 'package:newitempage/common_widgets/drawer.dart';
import 'package:newitempage/common_widgets/items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newitempage/common_widgets/constants.dart';
import 'package:newitempage/lists.dart' as shop;

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(context),
      drawer: CommonDrawer(context),
      body: ItemLists(),
      //body: Contain(list: shop.shops,length: shop.shops.length,wid: CommonAppBar(context),draw: CommonDrawer(context),),
    );
  }
}

class ItemLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('items').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        List l1 = List();
        if (!snapshot.hasData) return new Text('Loading...');
        shop.tempitems = List();
        snapshot.data.documents.map((document) {
          var doc = document.data['Items'];
          for(int i=0; i<doc.length; i++){
            shop.tempitems.add(doc[i]);
          }
          //print("Hello");
          //print(l1);
        }).toList();

//        for(int j=0; j<shop.shops.length;j++){
//          print(l1[j][Constant.itemName].toString());
//          shop.shops.add(l1[j][Constant.itemName.toString()]);
//          print(shop.shops);
//        }
        //print("l1");
        //print(l1);
        //print(shop.shops);
        return Change();
//        for(int i=0;i<shop.shops.length;i++){
//          l2.add(shop.shops[i][Constant.itemName.toString()].toString());
//        }
//        return Contain(list: shop.shops,length: shop.shops.length,wid: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),),draw: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),));
      },
    );
  }
}

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    shop.items=List();
    for(int i=0;i<shop.tempitems.length;i++){
      shop.items.add(shop.tempitems[i][Constant.itemName.toString()].toString());
    }
    return Contain(list: shop.items,length: shop.items.length,wid: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),),draw: PreferredSize(preferredSize: Size.fromHeight(1),child: Container(),));
  }
}
