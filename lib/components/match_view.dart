import 'package:dream/screens/match_screen.dart';
import 'package:flutter/material.dart';

import '../data/model/match.dart';

class MatchView extends StatelessWidget {

  final MatchDto match;

  MatchView(this.match, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToNewScreen(context); // 화면 전환 함수 호출
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
              child: Container(
                width: 10,
                height: 60,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: match.color
                ),
              )
          ),
          Container(
            width: 200,
            height: 60,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(7),
                )
            ),
            child: Column(
              children: [
                Text(match.title),
                Text(match.time),
              ],
            ),
          ),
        ],
      )
    );
  }

  void navigateToNewScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchScreen(match: match,)),
    );
  }
}
