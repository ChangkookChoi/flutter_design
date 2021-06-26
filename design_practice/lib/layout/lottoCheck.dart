import 'package:flutter/material.dart';

class LottoCheck extends StatefulWidget {
  @override
  _LottoCheckState createState() => _LottoCheckState();
}

class _LottoCheckState extends State<LottoCheck> {
  var _roundController = TextEditingController();
  var _lottoDate = '';
  var _lottoAmount = '';
  var _lottoPersonCnt = '0';

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
                child: TextField(
              controller: _roundController,
            )),
            ElevatedButton(
                onPressed: () {
                  //_roundController 값 검증 후 로또 api로 데이터 가져오는 로직 넣기
                },
                child: Text('조회')),
          ],
        ),
        Row(
          //회차에 해당하는 날짜가 표시될 부분 Row
          children: <Widget>[
            Text(
              '날짜 : ',
              style: TextStyle(fontSize: 25),
            ),
            Text(_lottoDate)
          ],
        ),
        Row(
          //1등 상금 및 몇 명이었는지 표시 할 Row
          children: <Widget>[
            Text('1등 상금 : '),
            Text(_lottoAmount),
            Text(_lottoPersonCnt),
            Text(' 명')
          ],
        ),
        Row(
          //로또 당첨번호 6개 + 보너스 1개 표시
          children: <Widget>[
            Container(
              child: Text('0'),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
