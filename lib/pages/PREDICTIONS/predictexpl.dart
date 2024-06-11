import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PneumoniaDetectionexplain extends StatefulWidget {
  @override
  _PneumoniaDetectionexplainState createState() =>
      _PneumoniaDetectionexplainState();
}

class _PneumoniaDetectionexplainState extends State<PneumoniaDetectionexplain> {
  File? _image;
  bool _loading = false;
  List<dynamic>? _output;
  String? _gradCamImageUrl;

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
      model: 'assets/Lastpneumoniavgg19.tflite',
      labels: 'assets/labels.txt',
    );
  }

  Future<void> _predictImage(File imageFile) async {
    setState(() {
      _loading = true;
    });

    try {
      var output = await Tflite.runModelOnImage(
        path: imageFile.path,
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

      // Fetch GradCAM image from Django
      _fetchGradCamImage(imageFile);
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

    if (_image != null) {
      _predictImage(_image!);
    }
  }

  Future<void> _fetchGradCamImage(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://explainability.pythonanywhere.com/'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = jsonDecode(await response.stream.bytesToString());
        String? camFileUrl = responseData['cam_file_url'];
        if (camFileUrl != null) {
          setState(() {
            _gradCamImageUrl =
                'https://explainability.pythonanywhere.com$camFileUrl';
          });
        }
      } else {
        print('Failed to fetch GradCAM image: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Failed to fetch GradCAM image: $e');
    }
  }

  Widget _getExplanationWidget() {
    if (_output != null && _output!.isNotEmpty) {
      int labelIndex = _output![0]['index'];
      if (labelIndex == 1) {
        // Index 1 corresponds to Pneumonia
        return Text('Explanation: Pneumonia detected');
      } else {
        return Text('Explanation: No pneumonia detected');
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pneumonia Detection',
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
                          if (_gradCamImageUrl != null)
                            Image.network(
                              _gradCamImageUrl!,
                              height: 200,
                              width: 330,
                            ),
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
