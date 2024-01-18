import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  late ImagePicker _imagePicker;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _getImage() async {
    final XFile? imageFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          // Image input section
          ElevatedButton(
            onPressed: _getImage,
            child: Text('Select Image'),
          ),
          _imageFile != null
              ? Image.file(
                  File(_imageFile!.path),
                  height: 100.0,
                  width: 100.0,
                )
              : Container(),
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
