import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:MiniApp/pages/OTHERS/Drawer.dart';
import 'package:MiniApp/pages/OTHERS/Profile.dart';
import 'package:MiniApp/pages/HOME/homepage.dart';
import 'package:MiniApp/pages/PATIENTS/patientlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final screens = [Homepage(), Patientlist(), Profile()];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home),
      Icon(Icons.group),
      Icon(Icons.person)
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 205, 223, 238),
        color: Color.fromARGB(148, 12, 50, 70),
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
