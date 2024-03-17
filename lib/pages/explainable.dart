import 'package:tflite_v2/tflite_v2.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Explainable extends StatefulWidget {
  @override
  _ExplainableState createState() => _ExplainableState();
}

class _ExplainableState extends State<Explainable> {
  File? _image;
  String _predictionResult = '';
  bool _isPredicting = false;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  void _loadModel() async {
    String? res;
    try {
      res = await Tflite.loadModel(
        model: 'lib/model/pneumonia_detection_model.tflite',
      );
      print('Model loaded: $res');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pneumonia Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('Select an image')
                : Image.file(_image!, height: 150),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictImage,
              child: Text('Predict'),
            ),
            SizedBox(height: 20),
            _isPredicting
                ? CircularProgressIndicator() // Progress indicator
                : Container(),
            SizedBox(height: 20),
            _predictionResult.isNotEmpty
                ? Text('Prediction Result: $_predictionResult')
                : Container(),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _predictionResult =
            ''; // Reset prediction result when a new image is selected
      });
    }
  }

  Future<void> _predictImage() async {
    if (_image != null) {
      await _predict(_image!);
    } else {
      print('No image selected');
      _showErrorSnackBar('Please select an image');
    }
  }

  Future<void> _predict(File imageFile) async {
    setState(() {
      _isPredicting = true;
    });

    // Run inference
    List<dynamic>? results;
    try {
      results = await Tflite.runModelOnBinary(
        binary: imageFile.readAsBytesSync(),
        numResults: 2,
        threshold: 0.5,
      );
      print('Prediction results: $results');
      double confidence = results![0]['confidence'];
      String label = results[0]['label'];
      _predictionResult =
          'Prediction: ${label == '0' ? 'Normal' : 'Infected'} (${(confidence * 100).toStringAsFixed(2)}%)';
    } catch (e) {
      print('Failed to make prediction: $e');
      _showErrorSnackBar('Failed to make prediction');
    }

    setState(() {
      _isPredicting = false;
    });
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
