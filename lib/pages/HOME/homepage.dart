import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hello_flutter/pages/DISEASES/Bronchiectasispage.dart';
import 'package:hello_flutter/pages/DISEASES/BronchitisPage.dart';
import 'package:hello_flutter/pages/OTHERS/Drawer.dart';
import 'package:hello_flutter/pages/DISEASES/Pneumoniapage.dart';
import 'package:hello_flutter/pages/DISEASES/tuberculosis.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _pageIndex = 0; // Keep track of the selected page index
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  String _selectedContent = 'none'; // Track which content to display

  // Method to get the appropriate content based on the selected type
  Widget _getSelectedContent() {
    switch (_selectedContent) {
      case 'pneumonia':
        return Pneumoniapage(); // Return the PneumoniaPage widget
      case 'tuberculosis':
        return Tuberculosispage(); // Return the TuberculosisPage widget
      case 'bronchitis':
        return Bronchitispage(); // Return the BronchitisPage widget
      case 'bronchiectasis':
        return Bronchiectasispage(); // Return the BronchiectasisPage widget
      default:
        return Pneumoniapage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LRTIS DETECTOR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap in SingleChildScrollView
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Dr Rusoke Marvin',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/images/doctor.png',
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Align to start
                          children: [
                            Text(
                              'How does the Patient Feel ?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Fill out this Medical Form',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/patientform');
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    'GET STARTED',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedContent = 'pneumonia';
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue[200],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'lib/icons/pneumonia.png',
                              height: 50,
                            ),
                            SizedBox(width: 8),
                            Text('Pneumonia'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedContent = 'tuberculosis';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue[200],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/icons/tuberculosis.png',
                                height: 50,
                              ),
                              SizedBox(width: 8),
                              Text('Tuberculosis'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedContent = 'bronchitis';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue[200],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/icons/bronchitis.png',
                                height: 50,
                              ),
                              SizedBox(width: 8),
                              Text('Bronchitis'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedContent = 'bronchiectasis';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue[200],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/icons/bronchiectasis.png',
                                height: 50,
                              ),
                              SizedBox(width: 8),
                              Text('Bronchiectasis'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: _getSelectedContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
