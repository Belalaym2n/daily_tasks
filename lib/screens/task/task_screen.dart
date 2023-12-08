import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:daily_tasks5/screens/task/task_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../models/task_mode.dart';
import '../../shared/network/firebase_managment/opperation_for_task.dart';
import 'add_task.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: EdgeInsets.all(12),
          child: CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 360)),
            lastDate: DateTime.now().add(Duration(days: 360)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {});
            },
            leftMargin: 30,
            monthColor: primaryColor,
            dayColor: Colors.black26,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: primaryColor,
            dotsColor: Colors.white,
            //selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
        ),
        Expanded(
            child: StreamBuilder(
          stream: OpperationForTask.getTask(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("something went wrong"));
            }
            List<TaskModel> tasks =
                snapshot.data!.docs.map((e) => e.data()).toList();
            if(tasks.isEmpty){
              return Text("No Tasks Yet");
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return TaskItem( taskModel: tasks[index],);
              },
              itemCount: tasks.length,
            );
          },
        )
            // ListView.builder(itemBuilder: (context, index) {
            //   return  TaskItem();
            // },itemCount: 4,),
            )
      ],
    );
  }
}
