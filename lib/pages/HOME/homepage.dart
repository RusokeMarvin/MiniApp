import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:MiniApp/pages/OTHERS/Drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _pageIndex = 0; // Keep track of the selected page index
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  String _selectedContent = 'none'; // Track which content to display
  String _userName = ''; // Store the user's name
  final TextEditingController _controller = TextEditingController();
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.reference().child('words');
  Set<String> _words = {};
  int _score = 0;
  String _feedback = '';

  @override
  void initState() {
    super.initState();
    _getUserName(); // Fetch the user's name when the widget is initialized
    _loadWords(); // Load the words from the database
  }

  Future<void> _getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _userName = user?.displayName ?? user?.email ?? 'User';
    });
  }

  void _loadWords() async {
    DatabaseEvent event = await _dbRef.once();
    DataSnapshot snapshot = event.snapshot;
    print('Snapshot: ${snapshot.value}');
    if (snapshot.value != null) {
      if (snapshot.value is List) {
        List<dynamic> wordList = snapshot.value as List<dynamic>;
        setState(() {
          _words =
              wordList.map((word) => word.toString().toLowerCase()).toSet();
        });
      } else if (snapshot.value is Map) {
        Map<dynamic, dynamic> wordMap = snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          _words = wordMap.values
              .map((word) => word.toString().toLowerCase())
              .toSet();
        });
      }
      print('Words loaded: $_words');
    } else {
      print('No data available.');
    }
  }

  void _checkWord() {
    String inputWord = _controller.text.trim().toLowerCase();
    print('User input: $inputWord');
    if (_words.contains(inputWord)) {
      setState(() {
        _score++;
        _feedback = 'Correct!';
      });
    } else {
      setState(() {
        _feedback = 'Incorrect!';
      });
    }
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MINI APP',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(148, 12, 50, 70),
      ),
      drawer: CustomDrawer(),
      backgroundColor: Color.fromARGB(255, 205, 223, 238),
      body: SafeArea(
        child: SingleChildScrollView(
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
                          _userName,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Enter a word',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _checkWord,
                      child: Text('Check Word'),
                    ),
                    SizedBox(height: 20),
                    Text('Score: $_score'),
                    SizedBox(height: 20),
                    Text(
                      _feedback,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
