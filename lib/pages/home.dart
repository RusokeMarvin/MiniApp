import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hello_flutter/pages/Profile.dart';
import 'package:hello_flutter/pages/homepage.dart';
import 'package:hello_flutter/pages/infections.dart';
import 'package:hello_flutter/pages/patientlist.dart';

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
    Infections(),
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
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(105),
                child: Image.asset(
                  'lib/images/doctor2.jpg',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      body: screens[index],
    );
  }
}
