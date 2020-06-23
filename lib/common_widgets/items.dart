//Kailash K S
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newitempage/lists.dart' as shop;
import 'package:newitempage/model/user.dart';
import 'package:provider/provider.dart';
import 'package:newitempage/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newitempage/common_widgets/itembuypage.dart';

class Contain extends StatefulWidget {
  static Map imageMap = {};
  final List itemList;
  final List itemNamelist;
  final int length;
  final Widget wid;
  final Widget draw;
  static String name = '';
  static String email = '';
  static String address1 = '';
  static String address2 = '';
  //static String uid;

  const Contain(
      {Key key,
      this.itemList,
      this.itemNamelist,
      this.length,
      this.wid,
      this.draw})
      : super(key: key);

  @override
  _ContainState createState() => _ContainState(
      this.itemList, this.itemNamelist, this.length, this.wid, this.draw);
}

class _ContainState extends State<Contain> {
  final List itemList;
  final List itemNamelist;
  final int length;
  final Widget wid;
  final Widget draw;
  String string = " ";
  //String name;
  _ContainState(
      this.itemList, this.itemNamelist, this.length, this.wid, this.draw);
  String rupee = "\u20B9";

  /// Made Changes here - ANIKET
  Widget imageDownloader({String itemName, String uid}) {
    Image image;
    if (Contain.imageMap[itemName] == null) {
      return FutureBuilder(
          future: DatabaseService(uid: uid).downloadItemPhoto(itemName),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data[0]) {
                image = Image.network(
                  snapshot.data[1],
                  fit: BoxFit.cover,
                );
                Contain.imageMap.addAll({itemName: image});
                return image;
              } else
                return Image.asset(
                  "lib/images/atta.png",
                  fit: BoxFit.contain,
                );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          });
    } else {
      shop.storeImage.add(Contain.imageMap[itemName]);
      return Contain.imageMap[itemName];
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of(context);

    return Scaffold(
      appBar: wid,
      drawer: draw,
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(1),
//        child: Container(),
//      ),//CommonAppBar(context),
      //drawer: CommonDrawer(context),
      body: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.white)]),
        margin: EdgeInsets.only(
          top: 15.0,
        ),
        child: Container(
          child: GridView.builder(
              itemCount: itemNamelist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.7,
                crossAxisCount: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ItemBuyPage(itemList: itemList[index])));
                  },
//                    onTap: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => ItemPage()), ///Idhr ItemPage() ki jagah dalde aur list[index] pass kar
//                      );
//                    },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1.0))),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //height: ,
                          width: MediaQuery.of(context).size.width*0.30,
                          margin: EdgeInsets.only(
                            top: 2.0,
                            left: 2.0,
                            bottom: 2.0,
                          ),

                          /// Made Changes here - ANIKET
                          child: imageDownloader(
                              itemName: itemList[index][0], uid: itemList[index][2]),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 15.0, left: 15.0),
                              child: Text("${itemList[index][0]}",
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 143, 143, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            //Atta - Whole Wheat
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 4.0),
                              child: Text("${itemList[index][0]}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(26, 26, 26, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 4.0),
                              child: Text("Qty : ${itemList[index][3]}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(26, 26, 26, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0, left: 15.0),
                              child: Row(
                                //crossAxisAlignment: CrossAxisAlignment.baseline,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "MRP: $rupee ${itemList[index][1]} ${itemList[index][1].length == 2 ? string*3 : string*2}",
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                  ),
                                    //Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.15
                                    ),
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    onPressed: () {
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
