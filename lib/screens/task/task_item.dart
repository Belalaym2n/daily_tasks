import 'dart:ui';

import 'package:daily_tasks5/shared/network/firebase_managment/opperation_for_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constant/color.dart';
import '../../models/task_mode.dart';

class TaskItem extends StatefulWidget {
  TaskModel taskModel;
  TaskItem({required this.taskModel, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
     margin: EdgeInsets.all(15),

        child: Slidable(
          startActionPane:  ActionPane(motion:DrawerMotion() ,
            children: [


              SlidableAction(
                padding: const EdgeInsets.all(012),

                onPressed:(context) {
       OpperationForTask.deleteTask(widget.taskModel.id);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                //padding: EdgeInsets.all(12),

                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(25),
                   bottomLeft: Radius.circular(25)
                 ),

              ),
              SlidableAction(
               // padding: const EdgeInsets.all(012),

                onPressed:(context) {

                },
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
                // borderRadius: BorderRadius.circular(25),

              ),
            ], ),
          child: Row(

            children: [

              Column(
                children: [
                  Container(

                    margin: EdgeInsets.all(15),
                    height: 70,
                    width: 3,
                    color: primaryColor,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Text("${widget.taskModel.tittle}",style: TextStyle(
                      color: primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                  )),
                  Text("${widget.taskModel.description}",style: TextStyle(
                      color: Colors.black54
                  ),),
                ],
              ),
              Spacer(
                flex: 4,
              ),

              Column(
                children: [

                  Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),


                      ),
                      height: 30,
                      width: 60,
                      margin: EdgeInsets.all(12),
                      child: Icon(Icons.done,size: 25,
                        color: Colors.white,
                      )),
                ],
              )

            ],
          ),
        ),

    );
  }
}