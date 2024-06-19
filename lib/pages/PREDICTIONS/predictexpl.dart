import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/EXPLAINABILITY/DEEPEXPLAIN/deepexplain.dart';
import 'package:hello_flutter/pages/EXPLAINABILITY/DEEPEXPLAIN/deepexplainnormal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as path;

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
  double _progress = 0.0;

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
      _progress = 0.2;
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
        _progress = 0.5;
      });

      print('Prediction output: $_output');

      // Fetch GradCAM image from Django
      await _fetchGradCamImage(imageFile);
    } catch (e) {
      print('Failed to run model on image: $e');
    } finally {
      setState(() {
        _loading = false;
        _progress = 1.0;
      });
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

  Future<void> _downloadImage() async {
    if (_gradCamImageUrl != null) {
      try {
        final response = await http.get(Uri.parse(_gradCamImageUrl!));
        if (response.statusCode == 200) {
          final directory = await getExternalStorageDirectory();
          final filePath = path.join(directory!.path, 'grad_cam_image.jpg');
          final file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image downloaded to $filePath')),
          );
        } else {
          print('Failed to download image: ${response.reasonPhrase}');
        }
      } catch (e) {
        print('Failed to download image: $e');
      }
    }
  }

  Future<void> _shareImage() async {
    if (_gradCamImageUrl != null) {
      try {
        final response = await http.get(Uri.parse(_gradCamImageUrl!));
        if (response.statusCode == 200) {
          final directory = await getTemporaryDirectory();
          final filePath = path.join(directory.path, 'grad_cam_image.jpg');
          final file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);
          Share.shareFiles([filePath], text: 'Grad-CAM Image');
        } else {
          print('Failed to share image: ${response.reasonPhrase}');
        }
      } catch (e) {
        print('Failed to share image: $e');
      }
    }
  }

  Widget _getExplanationWidget() {
    if (_output != null && _output!.isNotEmpty) {
      int labelIndex = _output![0]['index'];
      if (labelIndex == 1) {
        // Index 1 corresponds to Pneumonia
        return Explainabilitydeep();
      } else {
        return Explainnormaldeep();
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
        actions: [
          if (_gradCamImageUrl != null)
            IconButton(
              icon: Icon(Icons.download),
              onPressed: _downloadImage,
            ),
          if (_gradCamImageUrl != null)
            IconButton(
              icon: Icon(Icons.share),
              onPressed: _shareImage,
            ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2500,
                        percent: _progress,
                        center:
                            Text("${(_progress * 100).toStringAsFixed(1)}%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green,
                      ),
                    ],
                  )
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
          _getExplanationWidget(),
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
