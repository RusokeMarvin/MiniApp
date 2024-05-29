import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Drawer.dart';

class Infections extends StatefulWidget {
  const Infections({Key? key});

  @override
  State<Infections> createState() => _InfectionsState();
}

class _InfectionsState extends State<Infections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      appBar: AppBar(
        title: Text('ALL LRTIs'),
        backgroundColor: Colors.blue,
      ),
      drawer: CustomDrawer(),
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
                      Navigator.pushNamed(context, '/test');
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
