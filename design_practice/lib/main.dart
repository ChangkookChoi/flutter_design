import 'package:flutter/material.dart';
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
  int _ball1 = 0;
  int _ball2 = 0;
  int _ball3 = 0;
  int _ball4 = 0;
  int _ball5 = 0;
  int _ball6 = 0;

  //버튼 누르면 45개의 숫자 중 6개만 style 보여지게 만들기
  void _randomBall() {
    setState(() {
      List<int> newNumbers;

      for (int i = 0; i < 6; i++) {
        int tmp = Random().nextInt(45) + 1;
        while (newNumbers.contains(tmp)) {
          tmp = Random().nextInt(45) + 1;
          if (!newNumbers.contains(tmp)) {
            newNumbers.add(tmp);
          }
        }
      }
      _ball1 = Random().nextInt(45) + 1;
    });
  }

  //우선 45개의 번호부터 그려줘야 한다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 번호 자동 생성기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '1 : "$_ball1"',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '2 : "$_ball2"',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '3 : "$_ball3"',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '4 : "$_ball4"',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '5 : "$_ball5"',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '6 : "$_ball6"',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomBall,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
