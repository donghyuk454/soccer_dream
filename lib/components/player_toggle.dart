import 'package:flutter/material.dart';

class PlayerToggle extends StatelessWidget {
  String playerName = "";
  bool isChecked = true;
  void Function(bool)? onChanged;

  PlayerToggle({super.key, required this.playerName, required this.isChecked, required this.onChanged}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(3, 10, 0, 10),
      child: Row(
        children: [
          Flexible(flex: 3, child: Text(playerName)),
          Flexible(
              flex: 5,
              child: Switch(
                value: isChecked,
                onChanged: (value) {
                  onChanged!(value);
                },
              )
          )
        ],
      ),
    );
  }
}

