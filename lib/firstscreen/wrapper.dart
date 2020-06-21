import 'package:flutter/material.dart';
import 'package:newitempage/home/itemlist.dart';
import 'package:provider/provider.dart';
import 'package:newitempage/model/user.dart';
import 'package:newitempage/firstscreen/authenticate.dart';
import 'login.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);


    //return either authenticate or home
    if(user == null){
      return Authenticate();
    }
    else{
      MyHomePage.uid = user.uid;
      return ItemPage();
    }
  }
}