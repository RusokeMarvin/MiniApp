import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Predict.dart';
import 'package:hello_flutter/pages/Profile.dart';
import 'package:hello_flutter/pages/explainable.dart';
import 'package:hello_flutter/pages/home.dart';
import 'package:hello_flutter/pages/homepage.dart';
import 'package:hello_flutter/pages/infections.dart';
import 'package:hello_flutter/pages/patientform.dart';
import 'package:hello_flutter/pages/patientlist.dart';
import 'package:hello_flutter/pages/WelcomeScreen.dart';
import 'package:hello_flutter/pages/prediction.dart';
import 'package:hello_flutter/pages/predicttb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/homepage': (context) => Homepage(),
        '/home': (context) => Home(),
        '/patientform': (context) => Patientform(),
        '/patientlist': (context) => Patientlist(),
        '/infections': (context) => Infections(),
        '/test': (context) => PneumoniaDetection(),
        '/testtb': (context) => TbDetection(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
