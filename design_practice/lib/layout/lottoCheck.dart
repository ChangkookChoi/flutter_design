import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class LottoCheck extends StatefulWidget {
  @override
  _LottoCheckState createState() => _LottoCheckState();
}

class _LottoCheckState extends State<LottoCheck> {
  var _roundController = TextEditingController();
  var _lottoDate = '';
  var _lottoAmount = '';
  var _lottoPersonCnt = '0';
  var _drwNo = '';

  var _ball1 = '0';
  var _ball2 = '0';
  var _ball3 = '0';
  var _ball4 = '0';
  var _ball5 = '0';
  var _ball6 = '0';
  var _bonusBall = '0';

  BoxDecoration boxDeco() {
    return BoxDecoration();
  }

  @override
  void dispose() {
    _roundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('회차별 로또 조회')), body: _lottoBody());
  }

  //dialog
  void showCustomDialog(String str) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog  화면 모서리 둥글게
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Column(
              children: <Widget>[
                new Text('확인'),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[Text(str)],
            ),
            actions: <Widget>[
              new FlatButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  //3자리 콤마
  String numberWithComma(var param) {
    return new NumberFormat('###,###,###,###')
        .format(param)
        .replaceAll(' ', '');
  }

  //로또 회차 조회
  void getLottoInformation(String round) async {
    String shorts =
        'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=' +
            round;

    var url = Uri.parse(shorts);
    var response = await http.get(url);
    String statusCode = response.statusCode.toString();
    var responseHeaders = response.headers;
    //var responseBody = response.body;
    var responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> result = jsonDecode(responseBody);

    setState(() {
      // 통신결과가 200인지 확인
      if (statusCode == "200") {
        // 유효한 회차인 경우
        if (result['returnValue'] == "success") {
          print('$result');
          var brwNo = result['drwNo'];
          print('$brwNo 회차 정보');
          _drwNo = result['drwNo'].toString();
          _ball1 = result['drwtNo1'].toString();
          _ball2 = result['drwtNo2'].toString();
          _ball3 = result['drwtNo3'].toString();
          _ball4 = result['drwtNo4'].toString();
          _ball5 = result['drwtNo5'].toString();
          _ball6 = result['drwtNo6'].toString();
          _bonusBall = result['bnusNo'].toString();

          _lottoDate = result['drwNoDate'].toString();

          //print('====================' + result['firstWinamnt'].toString());
          _lottoAmount = numberWithComma(result['firstWinamnt']);
          _lottoPersonCnt = result['firstPrzwnerCo'].toString();
        } else {
          showCustomDialog('유효한 회차를 입력해주세요.');
        }
      } else {
        showCustomDialog('조회 중 오류가 발생했습니다.');
      }
    });
  }

  Widget _lottoBody() {
    return Column(
      children: <Widget>[
        Row(
          //input 및 Btn 부분 Row
          children: <Widget>[
            Expanded(
                child: TextFormField(
              controller: _roundController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: ' 조회하고자 하는 회차 번호'),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            )),
            ElevatedButton(
                onPressed: () {
                  if (_roundController.text != '') {
                    getLottoInformation(_roundController.text);
                  } else {
                    showCustomDialog('조회하고자 하는 회차를 입력해주세요.');
                  }
                },
                child: Text('조회')),
          ],
        ),
        Container(margin: EdgeInsets.only(top: 20)),
        Text('$_drwNo 회차 당첨 정보',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 30,
        ),
        Row(
          //회차에 해당하는 날짜가 표시될 부분 Row
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '날짜 : ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              _lottoDate,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          //1등 상금
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text('1등 상금 : $_lottoAmount 원',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Padding(
          //1등 당첨자 수
          padding: EdgeInsets.only(top: 20, left: 8.0, right: 8.0),
          child:
              Text('당첨자 : $_lottoPersonCnt 명', style: TextStyle(fontSize: 25)),
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          //로또 당첨번호 6개 + 보너스 1개 표시
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Text(_ball1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(child: Text('1번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text(_ball2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink.shade200,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.pink.shade200,
                    ),
                  ),
                ),
                Container(child: Text('2번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text(_ball3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.green,
                    ),
                  ),
                ),
                Container(child: Text('3번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
          ],
        ),
        Row(
          //4~6번째 공
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: Text(_ball4,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade200,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.purple.shade200,
                    ),
                  ),
                ),
                Container(child: Text('4번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text(_ball5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade300,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.blue.shade300,
                    ),
                  ),
                ),
                Container(child: Text('5번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text(_ball6,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(child: Text('6번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
          ],
        ),
        Row(
          //+아이콘 및 보너스 공
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(child: Icon(Icons.add)),
            Column(
              children: <Widget>[
                Container(
                  child: Text(_bonusBall,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal.shade300,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.teal.shade300,
                    ),
                  ),
                ),
                Container(child: Text('보너스'), margin: EdgeInsets.only(top: 10))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
