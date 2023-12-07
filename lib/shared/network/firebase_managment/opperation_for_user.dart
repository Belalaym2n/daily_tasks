import 'package:daily_tasks5/models/task_mode.dart';
import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/firebase_function.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_task.dart';

class OpperationalForUser{

  static void addUser(UserModel userModel){
    var collection=FirebaseCollection.creatUser();
    var docRef=collection.doc();

    docRef.set(userModel);
  }
}