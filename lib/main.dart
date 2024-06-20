import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/AUTHENTICATION/loginScreen.dart';
import 'package:hello_flutter/pages/INFECTIONS/Infectionsexplain.dart';
import 'package:hello_flutter/pages/PREDICTIONS/Predict.dart';
import 'package:hello_flutter/pages/OTHERS/Profile.dart';
import 'package:hello_flutter/pages/EXPLAINABILITY/explainability.dart';
import 'package:hello_flutter/pages/PREDICTIONS/multipredict.dart';
import 'package:hello_flutter/pages/PREDICTIONS/predictexpl.dart';
import 'package:hello_flutter/pages/explainable.dart';
import 'package:hello_flutter/pages/HOME/home.dart';
import 'package:hello_flutter/pages/HOME/homepage.dart';
import 'package:hello_flutter/pages/INFECTIONS/infections.dart';
import 'package:hello_flutter/pages/PATIENTS/patientform.dart';
import 'package:hello_flutter/pages/PATIENTS/patientlist.dart';
import 'package:hello_flutter/pages/WelcomeScreen.dart';
import 'package:hello_flutter/pages/OTHERS/prediction.dart';
import 'package:hello_flutter/pages/PREDICTIONS/predicttb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_flutter/pages/scans.dart';
import 'package:hello_flutter/pages/OTHERS/settings.dart';
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
        '/infectionsexplain': (context) => Infectionsexplain(),
        '/test1': (context) => PneumoniaDetectionexplain(),
        '/test2': (context) => MultiDetection(),
        '/login': (context) => loginScreen(),
      },
    );
  }
}
