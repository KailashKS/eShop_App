import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newitempage/loading.dart';
import 'package:newitempage/services/auth.dart';
import 'package:newitempage/services/database.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String dropdownValue = "Choose";
  String _email;
  String _pass;
  bool loading = false;
  String _address1;
  String _address2;
  String _name;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
//            Padding(
//              //padding: EdgeInsets.only(top: 10),
//            ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 55, 0.0, 0.0),
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 65.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: 35.0, left: 20.0, right: 20.0, bottom: 80.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? "Enter a valid name" : null,
                                decoration: InputDecoration(
                                    labelText: 'NAME',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green))),
                                onChanged: (val) {
                                  setState(() {
                                    _name = val;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? "Enter an email" : null,
                                  decoration: InputDecoration(
                                      labelText: 'EMAIL',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  onChanged: (val) {
                                    setState(() {
                                      _email = val;
                                    });
                                  }),
                              SizedBox(height: 10.0),
                              TextFormField(
                                  validator: (val) => val.length < 8
                                      ? "Password must be 8 characters or more"
                                      : null,
                                  decoration: InputDecoration(
                                      labelText: 'PASSWORD ',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      _pass = val;
                                    });
                                  }),
                              SizedBox(height: 10.0),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'HOUSE NUMBER',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green))),
                                  onChanged: (val) {
                                    setState(() {
                                      _address1 = val;
                                    });
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'MAIN ADDRESS',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.green))),
                                  onChanged: (val) {
                                    setState(() {
                                      _address2 = val;
                                    });
                                  }),
                              SizedBox(height: 20.0),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  "$error",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 40.0,
                                  child: RaisedButton(
                                    elevation: 7.0,
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          loading = true;
                                        });
                                        dynamic result = await _auth.register(
                                            _email.trim(), _pass.trim());
                                        await DatabaseService(uid: result.uid)
                                            .updateUserData(_name, _email, _address1,
                                                _address2);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                "Please enter a valid email";
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'SIGNUP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 40.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0),
                                      color: Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Center(
                                      child: Text('Go Back',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ]),
            ),
          );
  }}