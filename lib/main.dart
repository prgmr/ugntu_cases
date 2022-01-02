import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Case 6"),
      ),
      body: HomeScreen(),
    ),
  ));
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CounterStorage storage2 = CounterStorage();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter1 = 0;
  int _counter2 = 0;

  var textStyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _loadCounter1();
    widget.storage2.readCounter().then((int value) => {
          setState(() {
            _counter2 = value;
          })
        });
  }

  void _loadCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0);
    });
  }

  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter1', _counter1);
    });
  }

  Future<File> _incrementCounter2() {
    setState(() {
      _counter2++;
    });

    return widget.storage2.writeCounter(_counter2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "$_counter1",
                    style: textStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      _incrementCounter1();
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "$_counter2",
                    style: textStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      _incrementCounter2();
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/counter.txt");
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;
      final counters = await file.readAsString();

      return int.parse(counters);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    return file.writeAsString("$counter");
  }
}
