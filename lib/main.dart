//Kailash K S
import 'package:flutter/material.dart';
import 'model/user.dart';

//void main() {
////  runApp(MaterialApp(
////    home: ItemPage(),
////      //home: ItemPage(),
////    ));
////  }


class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        //home: Forgot(),
        home: Wrapper(),
        //home: Retrieve1(),
      ),
    );
  }
}