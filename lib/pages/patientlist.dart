import 'package:flutter/material.dart';

class Patientlist extends StatefulWidget {
  const Patientlist({super.key});

  @override
  State<Patientlist> createState() => _PatientlistState();
}

class _PatientlistState extends State<Patientlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PATIENTLIST',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
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
    );
  }
}
