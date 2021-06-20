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

  void _reset() {
    setState(() {
      _ball1 = 0;
      _ball2 = 0;
      _ball3 = 0;
      _ball4 = 0;
      _ball5 = 0;
      _ball6 = 0;
    });
  }

  //버튼 누르면 45개의 숫자 중 6개만 style 보여지게 만들기
  void _randomBall() {
    setState(() {
      _reset();

      List<int> newNumbers = [];

      for (int i = 0; i < 6; i++) {
        bool chk = false;
        int tmp = Random().nextInt(45) + 1;
        if (!newNumbers.contains(tmp)) {
          print('$i 번째 tmp : $tmp');
          newNumbers.add(tmp);
          chk = true;
        }

        while (newNumbers.contains(tmp) && !chk) {
          tmp = Random().nextInt(45) + 1;

          if (!newNumbers.contains(tmp)) {
            print('$i 번째 tmp : $tmp');
            newNumbers.add(tmp);
            chk = true;
          }
        }
      }

      newNumbers.sort();
      print(newNumbers.toString());
      _ball1 = newNumbers[0];
      _ball2 = newNumbers[1];
      _ball3 = newNumbers[2];
      _ball4 = newNumbers[3];
      _ball5 = newNumbers[4];
      _ball6 = newNumbers[5];
    });
  }

  //우선 45개의 번호부터 그려줘야 한다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('6개 번호 자동 생성기'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  '$_ball1',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              Container(
                child: Text(
                  '$_ball2',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  '$_ball3',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              Container(
                child: Text(
                  '$_ball4',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text(
                  '$_ball5',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo[200],
                ),
              ),
              Container(
                child: Text(
                  '$_ball6',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[300],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomBall,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
