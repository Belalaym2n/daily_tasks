

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks5/provider/my_provider.dart';
import 'package:daily_tasks5/screens/login/login_screen.dart';
import 'package:daily_tasks5/screens/login/login_tap.dart';
import 'package:daily_tasks5/screens/login/sign_up_tap.dart';
import 'package:daily_tasks5/screens/splash_screen/splash_screen.dart';
import 'package:daily_tasks5/screens/task/edit_task.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'layout/homeLayout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
//  FirebaseFirestore.instance.disableNetwork();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(create: (context) => MyProvider()..init(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pro.langcode),
     themeMode:pro.mode,
      debugShowCheckedModeBanner: false,

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context)=>SplashScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        LoginTab.routeName:(context)=>LoginTab(),
        SignUpTab.routeName:(context)=>SignUpTab(),
       // EditTask.routeName:(context)=>EditTask(),
        HomeLayout.routeName:(context)=>HomeLayout(),
      },
    );
  }
}

