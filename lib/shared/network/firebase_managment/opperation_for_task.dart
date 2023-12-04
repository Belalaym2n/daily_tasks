import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/task_mode.dart';
import 'firebase_function.dart';

class OpperationForTask {

  static addTask(TaskModel taskModel) {
    var collection = FirebaseFunction.taskCollection();
    var docref = collection.doc();
    taskModel.id = docref.id;
    docref.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime dateTime) {
    return
        //print ("iam here");
        FirebaseFunction.taskCollection()
            .where("date",
                isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
            .snapshots();
  }

  static Future<void> deleteTask(String id) async {
    FirebaseFunction.taskCollection().doc(id).delete();
  }


}
