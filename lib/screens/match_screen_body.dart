import 'package:flutter/material.dart';

import '../components/lineup-painter.dart';
import '../data/model/match.dart';

class MatchScreenBody extends StatelessWidget {
  final MatchDto match;

  MatchScreenBody({super.key, required this.match});

  @override
  Widget build(BuildContext context) {

    var lineup = Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/field.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: CustomPaint(
        size: Size(1000, 1000), // 이미지 크기 조절
        painter: LineupPainter(),
      ),
    );

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          child: Text("Premier League"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("home", style: TextStyle(fontSize: 15),),
                Text(match.home, style: TextStyle(fontSize: 35),),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text("vs", style: TextStyle(fontSize: 35),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("away", style: TextStyle(fontSize: 15),),
                Text(match.away, style: TextStyle(fontSize: 35),),
              ],
            ),
          ],
        ),
        Divider(),
        Expanded(
          child: ListView(
            children: [
              lineup
            ],
          ),
        ),
      ],
    );
  }
}