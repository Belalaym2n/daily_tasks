import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier{
  UserModel? userModel;
  User? firebaseUser;
  String langcode="en";
 late SharedPreferences prefs;
  init() async{
   prefs=await SharedPreferences.getInstance();
   langcode=  prefs.getString("language")??'en';
 }

  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
    initUser();
  }}


  changeLanguage(String languageCode) async {
    langcode=languageCode;
    notifyListeners();
   await prefs.setString("languageCode", langcode);
  }

  initUser()async{
    firebaseUser=FirebaseAuth.instance.currentUser;
    userModel=await OpperationalForUser.readUser(firebaseUser!.uid);
  notifyListeners();
  }


}