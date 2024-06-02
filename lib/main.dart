import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Predict.dart';
import 'package:hello_flutter/pages/Profile.dart';
import 'package:hello_flutter/pages/explainability.dart';
import 'package:hello_flutter/pages/explainable.dart';
import 'package:hello_flutter/pages/home.dart';
import 'package:hello_flutter/pages/homepage.dart';
import 'package:hello_flutter/pages/infections.dart';
import 'package:hello_flutter/pages/patientform.dart';
import 'package:hello_flutter/pages/patientlist.dart';
import 'package:hello_flutter/pages/WelcomeScreen.dart';
import 'package:hello_flutter/pages/prediction.dart';
import 'package:hello_flutter/pages/predicttb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_flutter/pages/scans.dart';
import 'package:hello_flutter/pages/settings.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/settings': (context) => SettingsPage(),
        '/explain': (context) => Explainability(),
        '/scans': (context) => ScanOptionsPage(),
      },
    );
  }
}
