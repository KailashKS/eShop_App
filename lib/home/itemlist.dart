//Kailash K S
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newitempage/common_widgets/appbar.dart';
import 'package:newitempage/common_widgets/drawer.dart';
import 'package:newitempage/common_widgets/items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newitempage/common_widgets/constants.dart';
import 'package:newitempage/lists.dart' as shop;
import 'package:newitempage/loading.dart';

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
    );
  }
}

class ItemLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    shop.items = List();
    shop.itemName = List();
    shop.tempitems = List();
    shop.userids = List();
    shop.shopName = List();
    var link = Map();
    return StreamBuilder(
      stream: Firestore.instance.collection('items').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        List l1 = List();
        if (!snapshot.hasData) return Loading();
        shop.tempitems = List();
        snapshot.data.documents.map((document) {
          var s = document.data['Shop Name'];
          if(shop.shopName.contains(s.toString())){}
          else{
            shop.shopName.add(s.toString());
          }

        }).toList();
        snapshot.data.documents.map((document) {
          var doc = document.data['Items'];
          var s = document.data['Shop Name'];
          for (int i = 0; i < doc.length; i++) {
            shop.tempitems.add(doc[i]);
          }
//          for (int i=0; i<s.length; i++){
//            shop.tempitems1.add(s[i]);
//          }
        }).toList();
        return Change();
      },
    );
  }
}

class Change extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    shop.itemName = List();
    for (int i = 0; i < shop.tempitems.length; i++) {
      if(shop.userids.contains(shop.tempitems[i]['UID'].toString())){}
      else{
        shop.userids.add(shop.tempitems[i]['UID'].toString());
      }
      shop.itemName.add(shop.tempitems[i][Constant.itemName.toString()].toString());
      shop.items.add([
        shop.tempitems[i][Constant.itemName.toString()].toString(),
        shop.tempitems[i][Constant.itemPrice.toString()].toString(),
        shop.tempitems[i]['UID'].toString(),
        shop.tempitems[i][Constant.itemQty.toString()].toString()
      ]);
    }
    for(int i=0; i<shop.userids.length;i++){
      shop.link['${shop.userids[i]}'] = '${shop.shopName[i]}';
    }

//    for(var i in shop.tempitems1){
//      shop.shopName.add(i);
//    }
    print("link : ${shop.link}");
    return Contain(
        itemNamelist: shop.itemName,
        itemList: shop.items,
        length: shop.items.length,
        wid: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(),
        ),
        draw: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(),
        ));
  }
}
