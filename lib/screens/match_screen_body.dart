import 'package:flutter/material.dart';

import '../components/lineup-painter.dart';
import '../data/model/match.dart';

class MatchScreenBody extends StatelessWidget {

  MatchDto match;

  MatchScreenBody({super.key, required this.match});

  @override
  Widget build(BuildContext context) {

    var lineUp = Flex(
      direction: Axis.vertical,
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(100, 0, 100, 100),
            alignment: Alignment.topCenter,
            child: CustomPaint(
              size: Size(300,300),
              painter: LineupPainter(),
              child: Image.asset('assets/images/field.jpg'),
            )
        ),
      ]
       );

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(15),
          child: Text("프리미어리그"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("home", style: TextStyle(fontSize: 15,),),
                Text(match.home, style: TextStyle(fontSize: 35,),),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text("vs", style: TextStyle(fontSize: 35),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("away", style: TextStyle(fontSize: 15,),),
                Text(match.away, style: TextStyle(fontSize: 35),)
              ],
            )
          ],
        ),
        Divider(),
        Flex(direction: Axis.vertical, children: [lineUp],)
      ],
    );
  }
}
