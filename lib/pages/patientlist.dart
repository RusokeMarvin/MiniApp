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
        title: Text('PATIENTS LIST'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
