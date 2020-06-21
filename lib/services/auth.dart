import 'package:firebase_auth/firebase_auth.dart';
import 'package:newitempage/model/user.dart';
import 'package:newitempage/services/database.dart';

class AuthService{

  //create user obj based on firebaseuser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid):null;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //get uid
  getUID() async {
    final FirebaseUser user = await _auth.currentUser();
    final String uid = user.uid;
    return uid.toString();
  }
  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }


  //register with email
  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create database


      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  //signout
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
    }
  }

  //forgot password
  Future resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}