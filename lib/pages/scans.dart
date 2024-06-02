import 'package:flutter/material.dart';
import 'package:hello_flutter/pages/Drawer.dart';

class ScanOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SCAN OPTIONS',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 205, 223, 238),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/infections');
                },
                child: Text('Quick Scan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                ),
                onPressed: () {
                  // Add your logic here
                },
                child: Text('Deep Scan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
