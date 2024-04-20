import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Patientform());
}

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
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final symptomsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: idController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.numbers),
              hintText: 'Assign ID',
              labelText: 'ID',
            ),
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
          ),
          TextFormField(
            controller: dobController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
          ),
          TextFormField(
            controller: symptomsController,
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
              onPressed: () {
                CollectionReference collRef =
                    FirebaseFirestore.instance.collection('client');
                collRef.add({
                  'id': idController.text,
                  'name': nameController.text,
                  'phone': phoneController.text,
                  'dob': dobController.text,
                  'symptoms': symptomsController.text,
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
