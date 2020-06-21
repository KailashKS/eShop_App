import 'package:flutter/material.dart';
import 'appbar.dart';
import 'drawer.dart';
import 'items.dart';
import 'package:newitempage/lists.dart';

class ShopList extends StatefulWidget {
  @override
  
  _ShopListState createState() => _ShopListState();
}


class _ShopListState extends State<ShopList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.white)]),
        margin: EdgeInsets.only(
          top: 15.0,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.9,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Contain(list: shop.shops,length: shop.shops.length,wid: CommonAppBar(context),draw: CommonDrawer(context),)),
                    //);
                  },
                  child: Container(
                    
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset('assets/images/grocery.jpg',fit: BoxFit.contain,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      color: Colors.black12),
              ),
              Text("Name"),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
              ]),
        
                  ),
                );
                // return GestureDetector(
                //   onTap: () {print("Hello");},
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       border: Border(
                //         bottom: BorderSide(color: Colors.grey, width: 0.5),
                //         left: BorderSide(color: Colors.grey, width: 0.5),
                //         right: BorderSide(color: Colors.grey, width: 0.5),
                //         top: BorderSide(color: Colors.grey, width: 0.5)
                //       ),
                //     ),
                //     child: Column(children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.only(top:3),
                //         height: 150,
                //         width: 200,
                //         child: Image(image: AssetImage('assets/images/grocery.jpg',),fit: BoxFit.contain,),
                //       )
                //     ],),
                //   ),
                // );
              }),
        ),
      
        
      ),
    );
  }
}