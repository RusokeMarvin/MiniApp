import 'package:flutter/material.dart';

class Patientform extends StatefulWidget {
  const Patientform({Key? key});

  @override
  State<Patientform> createState() => _PatientformState();
}

class _PatientformState extends State<Patientform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Text('PATIENT FORM'),
        backgroundColor: Colors.blue,
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.numbers),
              hintText: 'Assign ID',
              labelText: 'ID',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter symptoms',
              labelText: 'Symptoms',
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: ElevatedButton(
              child: const Text('Submit'),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}
