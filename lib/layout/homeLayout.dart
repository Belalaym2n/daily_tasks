
import 'package:daily_tasks5/models/user_model.dart';
import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:daily_tasks5/screens/login/login_screen.dart';
import 'package:daily_tasks5/screens/login/login_tap.dart';
import 'package:daily_tasks5/screens/login/sign_up_tap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/color.dart';
import '../screens/setting/setting_screen.dart';
import '../screens/task/add_task.dart';
import '../screens/task/task_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,

      extendBody: true,
      backgroundColor: mintGreen,
      appBar: AppBar(
actions: [


  IconButton(onPressed: () {
    FirebaseAuth.instance.sendPasswordResetEmail(email: pro.userModel!.email);
  }, icon: Icon(Icons.send)),
  IconButton(onPressed: () {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);

  }, icon: Icon(Icons.logout)),
  ],
        elevation: 0,
        title: Text("ToDo "),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:

      FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          floatingButtonSheet();


      },child: Icon(Icons.add),),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        color: Colors.white,
       elevation: 0,
        child: BottomNavigationBar(
        elevation: 0,
          backgroundColor: Colors.transparent,

            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },

            items: [

              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            ]),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [
    TaskScreen(),
    SettingScreen(),
  ];
  floatingButtonSheet(){

    showModalBottomSheet(
      isScrollControlled: true,
        elevation: 0,




        context: context,

        builder: (context) => Padding(
          padding:EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom
          ),
          child: AddTaskButtonSheet(),
        ));
  }
}
