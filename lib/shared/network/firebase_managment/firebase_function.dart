import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks5/models/user_model.dart';

import '../../../models/task_mode.dart';

class FirebaseCollection{

 static CollectionReference<TaskModel> taskCollection(){
    return
     FirebaseFirestore.instance.collection("Tasks").
     withConverter<TaskModel>(fromFirestore:(snapshot, _) {
       return TaskModel.fromJson(snapshot.data()!);

     },
         toFirestore: (task, _) {
       return task.toJson();

         },);
  }

 static CollectionReference<UserModel>  creatUser(){
   return
   FirebaseFirestore.instance.collection("Users").withConverter(
       fromFirestore: (snapshot, _) {
         return UserModel.fromJson(snapshot.data()!);

       },
       toFirestore:(user, _) {
         return user.toJson();
       }, );
  }

}