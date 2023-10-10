import 'package:flutter/material.dart';

class PlayerToggle extends StatelessWidget {
  String playerName = "";
  bool isChecked = true;
  void Function(bool)? onChanged;

  PlayerToggle({super.key, required this.playerName, required this.isChecked, required this.onChanged}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(playerName),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Switch(
                value: isChecked,
                onChanged: (value) {
                  onChanged!(value);
                },
              ),
            )
          ],
        ),
      )
    );
  }
}

