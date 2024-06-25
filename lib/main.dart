import 'package:flutter/material.dart';
import 'package:MiniApp/pages/AUTHENTICATION/loginScreen.dart';
import 'package:MiniApp/pages/OTHERS/Profile.dart';
import 'package:MiniApp/pages/HOME/home.dart';
import 'package:MiniApp/pages/HOME/homepage.dart';
import 'package:MiniApp/pages/PATIENTS/patientform.dart';
import 'package:MiniApp/pages/PATIENTS/patientlist.dart';
import 'package:MiniApp/pages/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:MiniApp/pages/OTHERS/settings.dart';
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
        '/profile': (context) => Profile(),
        '/settings': (context) => SettingsPage(),
        '/login': (context) => loginScreen(),
      },
    );
  }
}
