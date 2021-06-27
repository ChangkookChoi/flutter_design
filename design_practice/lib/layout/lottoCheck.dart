import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LottoCheck extends StatefulWidget {
  @override
  _LottoCheckState createState() => _LottoCheckState();
}

class _LottoCheckState extends State<LottoCheck> {
  var _roundController = TextEditingController();
  var _lottoDate = '';
  var _lottoAmount = '';
  var _lottoPersonCnt = '0';

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
                  //_roundController 값 검증 후 로또 api로 데이터 가져오는 로직 넣기
                },
                child: Text('조회')),
          ],
        ),
        Container(margin: EdgeInsets.only(top: 20)),
        Row(
          //회차에 해당하는 날짜가 표시될 부분 Row
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '날짜 : ',
              style: TextStyle(fontSize: 25),
            ),
            Text(_lottoDate)
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          //1등 상금 및 몇 명이었는지 표시 할 Row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('1등 상금 : $_lottoAmount 원'),
            SizedBox(
              width: 20,
            ),
            Text('$_lottoPersonCnt 명')
          ],
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
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
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
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(child: Text('2번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(child: Text('3번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(child: Text('4번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(child: Text('5번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Container(child: Text('6번 공'), margin: EdgeInsets.only(top: 10))
              ],
            ),
            Container(
              child: Text(' + '),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Text('45', textAlign: TextAlign.center),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                      width: 8.0,
                      color: Colors.orange,
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
