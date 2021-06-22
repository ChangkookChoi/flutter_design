import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Oeschinen Lake Campground', style: TextStyle()),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[350]),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  IconData(0xe5f9, fontFamily: 'MaterialIcons'),
                  color: Colors.red,
                ),
                Text('23'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  Icons.call,
                  color: Colors.blue[200],
                ),
                Text(
                  'CALL',
                  style: TextStyle(color: Colors.blue[200]),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.send,
                  color: Colors.blue[200],
                ),
                Text(
                  'ROUTE',
                  style: TextStyle(color: Colors.blue[200]),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.share,
                  color: Colors.blue[200],
                ),
                Text(
                  'SHARE',
                  style: TextStyle(color: Colors.blue[200]),
                ),
              ],
            ),
          ],
        ),
        Text('Lake Oeschinen lies at the foot of the Bluemlisalp in'
            'the Bernese Alps. Situated 1,578 meters above sea'
            'level, it is one of the larget Alpine Lakes. A gondola'
            'ride from Kandersteg, followed by a half-hour walk'
            'through pastures and pine forest, leads you to the'
            'lake, which warms to 20 degrees Celsius in the'
            'summer. Activities enjoyed here include rowing, and'
            'riding the summer toboggan run'),
      ],
    );
  }
}
