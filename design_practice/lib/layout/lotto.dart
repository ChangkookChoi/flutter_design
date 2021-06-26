import 'package:design_practice/layout/lottoCheck.dart';
import 'package:flutter/material.dart';
import 'package:design_practice/layout/lottoGenerator.dart';

class Lotto extends StatefulWidget {
  @override
  _LottoState createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LottoGenerator()));
          },
          child: Text('로또 번호 자동 생성기'),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LottoCheck()));
          },
          child: Text('회차별 당첨 번호 확인'),
        ),
      ],
    );
  }
}
