import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/homepage.dart';
import 'package:hello_flutter/pages/patientform.dart';
import 'package:hello_flutter/pages/patientlist.dart';
import 'package:hello_flutter/pages/prediction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        '/homepage': (context) => Homepage(),
        '/patientform': (context) => Patientform(),
        '/patientlist': (context) => Patientlist(),
        '/test': (context) => PneumoniaDetectionPage(),
      },
    );
  }
}
