//Kailash K S

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newitempage/common_widgets/appbar.dart';
import 'package:newitempage/common_widgets/constants.dart';
import 'package:newitempage/common_widgets/drawer.dart';

class Contain extends StatefulWidget {
  final List list;
  final int length;
  final Widget wid;
  final Widget draw;

  const Contain({Key key, this.list, this.length, this.wid, this.draw}) : super(key:key);

  @override
  _ContainState createState() => _ContainState(this.list,this.length,this.wid,this.draw);
}

class _ContainState extends State<Contain> {
  final List list;
  final int length;
  final Widget wid;
  final Widget draw;
  _ContainState(this.list,this.length,this.wid,this.draw);
    final cities = [
  ];
  List filtered = [];
  String rupee = "\u20B9";
  @override
  Widget build(BuildContext context) {
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
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.7,
                crossAxisCount: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
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
                          margin: EdgeInsets.only(
                            top: 2.0,
                            left: 15.0,
                            bottom: 2.0,
                          ),
                          child: Image(
                            fit: BoxFit.contain,
                            //image: NetworkImage('gs://shop-work-2f412.appspot.com/images/Yhxm38TUQshQxx1QLGkAs7aGISb2/items/meme'),
                            image: AssetImage('assets/images/atta.png'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 15.0, left: 15.0),
                              child: Text(
                                "AASHIRVAAD",
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
                              child: Text("${list[index]}",
                                  style: TextStyle(
                                      color: Color.fromRGBO(26, 26, 26, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 4.0),
                              child: Text("Qty : 100",
                                  style: TextStyle(
                                      color: Color.fromRGBO(26, 26, 26, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0, left: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "MRP: $rupee 350.00",
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.black),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width *
                                            0.1),
                                  ),
                                  FlatButton(
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    ),
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0)),
                                    onPressed: () {},
                                  )
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Column(
            children: <Widget>[
              new Text(
                "Available quantities for ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3.0),
              ),
              new Text(
                "Aashirvaad - Atta - Whole Wheat",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          content: Builder(
            builder: (context) {
              var height = 150;
              return Container(
                height: height.toDouble(),
                width: MediaQuery.of(context).size.width,
              );
            },
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
