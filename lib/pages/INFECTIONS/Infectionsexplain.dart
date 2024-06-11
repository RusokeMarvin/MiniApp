import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/OTHERS/Drawer.dart';

class Infectionsexplain extends StatefulWidget {
  const Infectionsexplain({Key? key});

  @override
  State<Infectionsexplain> createState() => _InfectionsexplainState();
}

class _InfectionsexplainState extends State<Infectionsexplain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      appBar: AppBar(
        title: Text('ALL LRTIs'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 3.5),
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/test1');
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
                          Text('Pneumonia'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/testtb');
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
                            Text('Tuberculosis'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
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
                        Text('Bronchitis'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
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
                          Text('Bronchiectasis'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
