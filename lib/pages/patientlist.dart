import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_flutter/pages/Drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Patientlist());
}

class Patientlist extends StatefulWidget {
  const Patientlist({Key? key}) : super(key: key);

  @override
  State<Patientlist> createState() => _PatientlistState();
}

class _PatientlistState extends State<Patientlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PATIENTLIST',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('client').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final List<DocumentSnapshot> clients =
              snapshot.data!.docs.reversed.toList();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Phone')),
                DataColumn(label: Text('DOB')),
                DataColumn(label: Text('Symptoms')),
              ],
              rows: clients
                  .map(
                    (client) => DataRow(cells: [
                      DataCell(Text(client['id'].toString())),
                      DataCell(Text(client['name'].toString())),
                      DataCell(Text(client['phone'].toString())),
                      DataCell(Text(client['dob'].toString())),
                      DataCell(Text(client['symptoms'].toString())),
                    ]),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
