import 'dart:ui';

import 'package:daily_tasks5/screens/task/edit_task.dart';
import 'package:daily_tasks5/shared/network/firebase_managment/firebase_function.dart';
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
      // color: widget.taskModel.isDone?
      // Colors.green:
      // Colors.white,
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
                icon: Icons.edit,
                label: 'Edit',
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
                    color:
                    widget.taskModel.isDone?
                        Colors.green:
                    primaryColor,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  Text("${widget.taskModel.tittle}",style: TextStyle(
                      color:
                      widget.taskModel.isDone?
                          Colors.green:
                      primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                  )),
                  Text("${widget.taskModel.description}",style: TextStyle(
                      color:
                      widget.taskModel.isDone?
                          Colors.green:
                      Colors.black54
                  ),),
                ],
              ),
              Spacer(
                flex: 4,
              ),

              Column(
                children: [

                  InkWell(
                    onTap: () {
                      widget.taskModel.isDone=true;
                      setState(() {
                        OpperationForTask.updateTask(widget.taskModel);

                      });

                    },
                    child: Container(
                        decoration: BoxDecoration(


                          color:  widget.taskModel.isDone?
                          Colors.green:
                          primaryColor,
                          borderRadius: BorderRadius.circular(12),


                        ),
                        height: 40,
                        width: 70,
                        margin: EdgeInsets.all(12),
                        child:
                        widget.taskModel.isDone?
                            Center(child: Text("Done!",style: TextStyle(
                              color: Colors.white
                            ),)):
                        Icon(Icons.done,size: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              )

            ],
          ),
        ),

    );
  }

}