import 'package:dream/screens/match_screen.dart';
import 'package:flutter/material.dart';

class MatchView extends StatelessWidget {

  final String title;
  final String time;

  MatchView(this.title, this.time, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToNewScreen(context); // 화면 전환 함수 호출
      },
      child: Container(
        width: 150,
        height: 40,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(10),
          )
        ),
        child: Column(
          children: [
            Text(title),
            Text(time),
          ],
        ),
      ),
    );
  }

  void _navigateToNewScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchScreen()),
    );
  }
}
