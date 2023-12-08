import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class MyProvider extends ChangeNotifier{
  UserModel? userModel;
  User? firebaseUser;
  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
    initUser();
  }}


  initUser()async{
    firebaseUser=FirebaseAuth.instance.currentUser;
    userModel=await OpperationalForUser.readUser(firebaseUser!.uid);
  notifyListeners();
  }
}