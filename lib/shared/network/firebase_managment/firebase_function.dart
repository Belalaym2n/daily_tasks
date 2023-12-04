import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../models/task_mode.dart';

class FirebaseFunction{

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

}