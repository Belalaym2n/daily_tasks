import 'dart:async';


import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:daily_tasks5/screens/login/login_screen.dart';
import 'package:daily_tasks5/screens/task/task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../constant/color.dart';
import '../../layout/homeLayout.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="splash";
 
  
  
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    Timer(Duration(
       seconds: 3
     ), () {
      pro.firebaseUser !=null?
       Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName,
               (route) => false):
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,
              (route) => false);
     });
    return Stack(
      children: [
        Container(

          color: mintGreen,
        ),
      Center(child: Image(image: AssetImage("assets/images/splash-light.png"),fit: BoxFit.cover)),

      ],
    );
  }
}
