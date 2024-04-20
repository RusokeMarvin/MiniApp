import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class TbDetection extends StatefulWidget {
  @override
  _TbDetectionState createState() => _TbDetectionState();
}

class _TbDetectionState extends State<TbDetection> {
  File? _image;
  bool _loading = false;
  List<dynamic>? _output;

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model:
          'assets/Tuberculosisvgg19.tflite', // Path to your TensorFlow Lite model
      labels: 'assets/labelstb.txt', // Path to labels file
    );
  }

  Future<void> _predictImage() async {
    if (_image == null) return;
    setState(() {
      _loading = true;
    });

    var output = await Tflite.runModelOnImage(
      path: _image!.path,
      numResults: 2, // Number of classification results
    );

    setState(() {
      _output = output;
      _loading = false;
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    _predictImage();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('TB Detection', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: _loading
            ? CircularProgressIndicator()
            : _output != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.file(
                        _image!,
                        height: 300,
                      ),
                      SizedBox(height: 20),
                      Text('Prediction: ${_output![0]['label']}'),
                      Text(
                          'Confidence: ${(_output![0]['confidence'] * 100).toStringAsFixed(2)}%'),
                    ],
                  )
                : Text('No image selected'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[100],
        onPressed: _getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.image),
      ),
    );
  }
}
