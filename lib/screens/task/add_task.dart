
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Form(
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
                    fontSize: 22
                ),),
              ),

              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .03,
              ),
              TextFormField(
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
                        color: primaryColor,
                        width: 2,

                      )

                  ),
                  enabledBorder:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,),),


                  label: Text("description"),

                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .02,
              ),
              TextFormField(
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
                        color: primaryColor,
                        width: 2,

                      )

                  ),
                  enabledBorder:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2,),),


                  label: Text("tittle"),

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
                    fontSize: 22
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
                  child: Text(selectedDate.toString().substring(0,10)))

              ),
              ElevatedButton(onPressed: () {

                if(formKey.currentState!.validate()){
                  TaskModel task=TaskModel(
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
