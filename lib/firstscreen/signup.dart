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
  String _add;
  String _name;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
                      padding: EdgeInsets.fromLTRB(15.0, 80, 0.0, 0.0),
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 95, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    )
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
                                  borderSide: BorderSide(color: Colors.green))),
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
                            validator: (val) =>
                            val.length<8 ? "Password must be 8 characters or more" : null,
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
                                labelText: 'ADDRESS',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green))),
                            onChanged: (val) {
                              setState(() {
                                _add = val;
                              });
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: drop(),
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(height: 20, child: Text("$error", style: TextStyle(fontSize: 15.0, color: Colors.red),),),
                        SizedBox(height: 20, ),
                        Container(
                            height: 40.0,
                            child: RaisedButton(
                              elevation: 7.0,
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () async {
                                if (_formKey.currentState.validate() && dropdownValue != 'Choose') {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.register(_email.trim(), _pass.trim());
                                  await DatabaseService(uid: result.uid).updateUserData(_name, _email, _add, dropdownValue);
                                  if(result == null){
                                    setState(() {
                                      error = "Please enter a valid email";
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
                        SizedBox(height: 20.0,),
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
                                borderRadius: BorderRadius.circular(20.0)),
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
  }

  DropdownButton drop() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Choose',
        'Customer',
        'Pharmacy',
        'Doctor',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
                color: Colors.green.shade700,
                fontFamily: 'Montserrat',
                fontSize: 18),
          ),
        );
      }).toList(),
    );
  }
}
