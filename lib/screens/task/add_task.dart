
import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../models/task_mode.dart';
import '../../shared/network/firebase_managment/opperation_for_task.dart';

class AddTaskButtonSheet extends StatefulWidget {
  @override
  State<AddTaskButtonSheet> createState() => _AddTaskButtonSheetState();
}
var formKey=GlobalKey<FormState>();
var selectedDate=DateTime.now();

class _AddTaskButtonSheetState extends State<AddTaskButtonSheet> {

  @override
  Widget build(BuildContext context) {
    var tittleControllar = TextEditingController();
    var descriptionControllar = TextEditingController();
    var pro=Provider.of<MyProvider>(context);
    return Container(
      color: pro.mode==ThemeMode.dark?
      blackColor:Colors.white
      ,
      child: Form(

        key: formKey,
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * .5,
          margin: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .02,
                ),
                Center(
                  child: Text("Add new Task", style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    color: pro.mode==ThemeMode.light?
                    Colors.black:
                    Colors.white
                  ),),
                ),

                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .03,
                ),
                TextFormField(
                  style: TextStyle(
                    color:  pro.mode==ThemeMode.light?
                    Colors.black:
                    Colors.white,
                  ),
                  controller: tittleControllar,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your tittle";
                    }
                    return null;
                  },

                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color:
                          pro.mode==ThemeMode.light?
                          primaryColor:
                          Colors.white,

                          width: 2,

                        )

                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color:  pro.mode==ThemeMode.light?
                        primaryColor:
                        Colors.white,
                        width: 2,),),


                    label: Text("tittle",style: TextStyle(
                      color: pro.mode==ThemeMode.light?
                      Colors.black:
                      Colors.white
                    ),)

                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .02,
                ),
                TextFormField(

                  style: TextStyle(
                    color:  pro.mode==ThemeMode.light?
                    Colors.black:
                    Colors.white,
                  ),
                  controller: descriptionControllar,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your description";
                    }
                    return null;
                  },

                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color:  pro.mode==ThemeMode.light?
                          primaryColor:
                          Colors.white,
                          width: 2,

                        )

                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color:  pro.mode==ThemeMode.light?
                      primaryColor:
                      Colors.white,
                        width: 2,),),


                    label: Text("description",style: TextStyle(
                        color: pro.mode==ThemeMode.light?
                        Colors.black:
                        Colors.white
                    ),),

                  ),

                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .03,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("select time", style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,

                  color: pro.mode==ThemeMode.light?
                  Colors.black:
                  Colors.white

                  ),),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .02,
                ),

                Center(child: InkWell(
                    onTap: () {
                      selectDate();
                    },
                    child: Text(selectedDate.toString().substring(0,10),style: TextStyle(
                        color: pro.mode==ThemeMode.light?
                        Colors.black:
                        Colors.white
                    ),))

                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  pro.mode==ThemeMode.light?
                    primaryColor:
                    Colors.transparent,
                  ),
                    onPressed: () {


                  if(formKey.currentState!.validate()){
                    TaskModel task=TaskModel(
                      userUid: FirebaseAuth.instance.currentUser!.uid,
                        tittle: tittleControllar.text,
                        description: descriptionControllar.text,
                        date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                    OpperationForTask.addTask(task);
                    Navigator.pop(context);
                  }}


                    , child: Text('Add Task')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  selectDate()async{
    DateTime? choosenDate=await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 360)));

    if(choosenDate==null){
      return;
    }
    selectedDate=choosenDate;

    setState(() {
      DateTime.now()==choosenDate;

    });
  }

}
