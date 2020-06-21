//Kailash K S
import 'package:flutter/material.dart';
import 'model/user.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'firstscreen/wrapper.dart';

//void main() {
////  runApp(MaterialApp(
////    home: ItemPage(),
////      //home: ItemPage(),
////    ));
////  }

void main() {
  runApp(Main());
}

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