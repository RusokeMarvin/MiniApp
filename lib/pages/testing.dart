import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_v2/tflite_v2.dart';
import 'package:image_picker/image_picker.dart';

class CassavaPage extends StatefulWidget {
  static const routeName = "/cassava-page";

  const CassavaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CassavaPageState createState() => _CassavaPageState();
}

class _CassavaPageState extends State<CassavaPage> {
  static const String mobile = "MobileNet";

  bool recogAvail = false;
  bool solutionsAvailable = false;

  Future<void> _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      _busy = true;
    });
    File imagefile = convertXfiletoFile(image);
    predictImage(imagefile);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
    });
    File imagefile = convertXfiletoFile(image);
    predictImage(imagefile);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  void _showImageOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take Picture'),
              onTap: () {
                _getImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Upload Picture'),
              onTap: () {
                _getImageFromGallery();
              },
            ),
          ],
        );
      },
    );
  }

  File? _image;
  List? _recognitions;
  final String _model = mobile;
  double? _imageHeight;
  double? _imageWidth;
  bool _busy = false;

  convertXfiletoFile(XFile xfile) {
    String path = xfile.path;
    File imageasfile = File(path);
    return imageasfile;
  }

  Future predictImagePicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
    });
    File imagefile = convertXfiletoFile(image);
    predictImage(imagefile);
  }

  Future predictImage(File image) async {
    switch (_model) {
      default:
        await recognizeImage(image);
      // await recognizeImageBinary(image);
    }

    FileImage(image)
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        print(
            "-----------------------------using image resizing dimensions---------------------------------");
        _imageHeight = info.image.height.toDouble();
        _imageWidth = info.image.width.toDouble();
        // _imageHeight = 1500;
        // _imageWidth = 1000;
      });
    }));

    setState(() {
      _image = image;
      _busy = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String? res;
      switch (_model) {
        default:
          res = await Tflite.loadModel(
            model: "lib/assets/crops/cassava_model_unquant.tflite",
            labels: "lib/assets/crops/cassava_labels.txt",
            // useGpuDelegate: true,
          );
      }
      print(res);
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  getRed(img.Pixel pixel) {
    img.Image? image;
    return image!.getColor(255, 0, 0);
  }

  getGreen(img.Pixel pixel) {
    img.Image? image;
    return image!.getColor(0, 255, 0);
  }

  getBlue(img.Pixel pixel) {
    img.Image? image;
    return image!.getColor(0, 0, 255);
  }

  Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = getRed(pixel);
        buffer[pixelIndex++] = getGreen(pixel);
        buffer[pixelIndex++] = getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Future recognizeImage(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Future recognizeImageBinary(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var imageBytes = (await rootBundle.load(image.path)).buffer;
    img.Image? oriImage = img.decodeJpg(imageBytes.asUint8List());
    img.Image resizedImage = img.copyResize(oriImage!, height: 224, width: 224);
    var recognitions = await Tflite.runModelOnBinary(
      binary: imageToByteListFloat32(resizedImage, 224, 127.5, 127.5),
      numResults: 6,
      threshold: 0.05,
    );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: _image == null
          ? const Column(
              children: [
                Text('No image selected.'),
              ],
            )
          : Image.file(_image!),
    ));

    if (_model == mobile) {
      stackChildren.add(
        Center(
          child: Column(
            children: _recognitions != null
                ? _recognitions!.map(
                    (res) {
                      setState(() {
                        recogAvail = true;
                      });
                      print(
                          "Index: ${res["index"]}, Label: ${res["label"]}, Confidence: ${res["confidence"].toStringAsFixed(3)}");

                      return Text(
                        " ${res["label"]}: ${(res["confidence"] * 100).toStringAsFixed(1)}%",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          background: Paint()..color = Colors.white,
                        ),
                      );
                    },
                  ).toList()
                : [],
          ),
        ),
      );
    }
    if (_busy) {
      stackChildren.add(const Opacity(
        opacity: 0.3,
        child: ModalBarrier(dismissible: false, color: Colors.grey),
      ));
      stackChildren.add(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    solutionfunction() {
      if (_recognitions != null) {
        var solution = _recognitions!.map(
          (e) {
            switch (e["label"]) {
              case "Cassava Blight":
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Solutions to stop Cassava Blight ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.green[700],
                                fontSize: 18)),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "- Use Disease-Free Planting Material: Start with healthy, disease-free planting materials to minimize the chances of introducing the disease to new areas. \n - Crop Rotation: Practice crop rotation to break the disease cycle. Avoid planting cassava or related crops in the same field for consecutive seasons. \n - Resistant Varieties: Plant resistant cassava varieties that have shown resistance to CBSD and CMD. Utilize improved varieties that have been bred to withstand the disease. \n - Early Detection and Removal: Regularly monitor your cassava plants for any signs of disease. If infected, remove and destroy the affected plants to prevent the spread of the disease. \n - Proper Planting Density: Avoid planting cassava too closely, as this can promote the spread of diseases due to increased humidity and reduced airflow. \n - Pruning and Thinning: Regularly prune and thin cassava plants to remove infected and weak parts, improving overall plant health.",
                          ),
                        )
                      ],
                    )
                  ],
                );

              //print(e["label"]);

              case "Cassava brown streak virus":
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Solutions to stop Cassava brown streak virus ",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.green[700],
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "- Planting cuttings from disease-free areas/gardens after being certified by MAAIF \n - Planting tolerant varieties e.g. NASE 14, 19, and NAROCAS1. (Farmers should from time to time seek advice from Extension staff on the latest tolerant varieties)Uprooting and burying or burning diseased plants or entire field. \n - Integrated disease management. \n - Most CMD resistant/tolerant varieties are susceptible to CBSD but the tolerant varieties currently recommended to farmers include NASE 14, 19 and NAROCAS1."),
                        )
                      ],
                    )
                  ],
                );
              case "Cassava green mite":
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Solutions to stop Cassava green mite ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.green[700],
                                fontSize: 18)),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                                "To avoid this pest, make sure to plant early at the onset of rains. \n Biological control through using predatory mites and parasites. \n Carry out crop rotation. \n Integrated Pest Management is also highly advisable."),
                          ),
                        )
                      ],
                    )
                  ],
                );

              case "Cassava Mosaic":
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Solutions to stop Cassava Mosaic ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.green[700],
                                fontSize: 18)),
                      ],
                    ),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                              "- Plant resistant or tolerant varieties e.g. the NASE and TME varieties (e.g. NASE 14, 15, 16, 17, 18, 19, NAROCAS 1, 2 and TME 14 and 204) \n - Practice crop rotation with legumes \n - Use disease-free planting material"),
                        )
                      ],
                    )
                  ],
                );

              case "Healthy Cassava":
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Cassava is Healthy ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.green[700],
                                fontSize: 18)),
                      ],
                    ),
                    const Column(
                      children: [Text("")],
                    )
                  ],
                );
              case "Background without leaves/crops":
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("This is not a Cassava ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.red[700],
                                fontSize: 18)),
                      ],
                    ),
                    const Column(
                      children: [Text("")],
                    )
                  ],
                );

              default:
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(" Theres no crop provided ",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.red[700],
                                fontSize: 18)),
                      ],
                    ),
                    const Column(
                      children: [Text("")],
                    )
                  ],
                );
            }
          },
        ).toList();
        return solution;
      }

      //print(solution);

      // setState(() {
      //   solutionsshown = true;
      // });

      //return const ListTile(title: Text("sdfsdfsdfdsfsfsdf"));
      //return ListView.builder(itemBuilder: (context,  .length){})
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cassava Detection Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: Stack(
                children: stackChildren,
              ),
            ),
            const SizedBox(height: 30),
            recogAvail
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        solutionsAvailable = !solutionsAvailable;
                      });
                    }, //solutionfunction,
                    child: const Text("See possible solutions"),
                  )
                : const Text("Please select an Image"),
            solutionfunction() != null //.isNotEmpty
                ? SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: solutionfunction()!.length,
                        itemBuilder: (context, index) {
                          return solutionfunction()?.elementAt(index);
                        }))
                : Container()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showImageOptions,
        tooltip: 'Pick Image',
        child: const Icon(Icons.image),
      ),
    );
  }
}
