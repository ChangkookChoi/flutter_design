import 'package:flutter/material.dart';
import 'package:design_practice/layout/map_detail.dart';
import 'package:design_practice/layout/lotto.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int _selectIndex = 0;

    void _checkIndex(int index) {
      setState(() {
        _selectIndex = index;
        print('$_selectIndex');
      });
    }

    List _pages = [Maps(), Text('main'), Lotto(), Maps()];

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(child: _pages[_selectIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _checkIndex,
        currentIndex: _selectIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
    );
  }
}
