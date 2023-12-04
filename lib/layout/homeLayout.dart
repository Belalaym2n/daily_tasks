
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      extendBody: true,
      backgroundColor: mintGreen,
      appBar: AppBar(
        elevation: 0,
        title: Text("Daily Task"),
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
