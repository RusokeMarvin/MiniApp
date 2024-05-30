import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/explainabilityTB.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'package:hello_flutter/pages/explainnormal.dart';

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

    try {
      var output = await Tflite.runModelOnImage(
        path: _image!.path,
        numResults: 2,
        imageMean: 0.0,
        imageStd: 255.0,
        threshold: 0.2,
        asynch: true,
      );

      setState(() {
        _output = output;
        _loading = false;
      });

      print('Prediction output: $_output');
    } catch (e) {
      print('Failed to run model on image: $e');
    }
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

  Widget _getExplanationWidget() {
    if (_output != null && _output!.isNotEmpty) {
      int labelIndex = _output![0]['index'];
      if (labelIndex == 1) {
        // Index 1 corresponds to Pneumonia
        return ExplainabilityTB();
      } else {
        return Explainnormal();
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TB Detection',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: _loading
                ? CircularProgressIndicator()
                : _output != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Image.file(
                            _image!,
                            height: 200,
                            width: 330,
                          ),
                          Text('Prediction: ${_output![0]['label']}'),
                          Text(
                              'Confidence: ${(_output![0]['confidence'] * 100).toStringAsFixed(2)}%'),
                          _getExplanationWidget(),
                        ],
                      )
                    : Text('No image selected'),
          ),
        ],
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
