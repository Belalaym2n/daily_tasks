import 'package:daily_tasks5/screens/login/login_tap.dart';
import 'package:daily_tasks5/screens/login/sign_up_tap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login";

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child:
        Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Login"),
              ),
              Tab(
                child: Text("SignUp"),
              ),
            ]),
          ),
          body: TabBarView(children: [
            LoginTab(),
            SignUpTab()
          ]),
        ));

}}
