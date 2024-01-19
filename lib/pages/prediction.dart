import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PneumoniaDetectionPage extends StatefulWidget {
  @override
  _PneumoniaDetectionPageState createState() => _PneumoniaDetectionPageState();
}

class _PneumoniaDetectionPageState extends State<PneumoniaDetectionPage> {
  File? _image;
  late String _predictionResult;
  bool _isPredicting = false;

  Future<void> _uploadImage(File image) async {
    setState(() {
      _isPredicting = true; // Show progress bar when predicting starts
    });

    final uri =
        Uri.parse("https://pneumonia-ov5m.onrender.com/predict_pneumonia/");

    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        final jsonResponse = await http.Response.fromStream(response);
        final data = json.decode(jsonResponse.body);
        setState(() {
          _predictionResult = data['result'];
        });
      } else {
        print('Error: ${response.reasonPhrase}');
        _showErrorSnackBar('Failed to make prediction');
      }
    } catch (error) {
      print('Error: $error');
      _showErrorSnackBar('Error during prediction process');
    } finally {
      setState(() {
        _isPredicting = false; // Hide progress bar when predicting completes
      });
    }
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
      await _uploadImage(_image!);
    } else {
      print('No image selected');
      _showErrorSnackBar('Please select an image');
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _predictionResult = ''; // Initialize _predictionResult here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            Text('Pneumonia Detection', style: TextStyle(color: Colors.white)),
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
              onPressed: () async {
                await _pickImage();
              },
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _predictImage();
              },
              child: Text('Predict'),
            ),
            SizedBox(height: 20),
            _isPredicting
                ? LinearProgressIndicator() // Progress bar
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
}

void main() {
  runApp(MaterialApp(
    home: PneumoniaDetectionPage(),
  ));
}
