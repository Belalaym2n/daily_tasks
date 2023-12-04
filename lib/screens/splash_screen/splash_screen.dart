import 'dart:async';


import 'package:flutter/cupertino.dart';

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
     Timer(Duration(
       seconds: 10
     ), () { 
       Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
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
