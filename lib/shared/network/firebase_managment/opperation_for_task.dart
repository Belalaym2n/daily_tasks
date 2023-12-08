import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/task_mode.dart';
import 'firebase_function.dart';

class OpperationForTask {

  static addTask(TaskModel taskModel) {
    var collection = FirebaseCollection.taskCollection();
    var docref = collection.doc();
    taskModel.id = docref.id;
    docref.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime dateTime) {
    return

      FirebaseCollection.taskCollection().where("userUid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("date",
                isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
            .snapshots();
  }
  static updateTask(TaskModel taskModel){
    FirebaseCollection.taskCollection().doc(taskModel.id).update(taskModel.toJson());

  }


  static Future<void> deleteTask(String id) async {
    FirebaseCollection.taskCollection().doc(id).delete();
  }




}
