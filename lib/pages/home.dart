import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hello_flutter/pages/Drawer.dart';
import 'package:hello_flutter/pages/Profile.dart';
import 'package:hello_flutter/pages/homepage.dart';
import 'package:hello_flutter/pages/infections.dart';
import 'package:hello_flutter/pages/patientlist.dart';
import 'package:hello_flutter/pages/scans.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final screens = [
    Homepage(),
    Patientlist(),
    ScanOptionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home),
      Icon(Icons.group),
      Icon(Icons.remove_red_eye)
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 205, 223, 238),
        color: Colors.blue,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
      drawer: CustomDrawer(),
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      body: screens[index],
    );
  }
}
