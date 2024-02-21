import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
  String? name;

  NameScreen({super.key, this.name});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      alignment: Alignment.bottomRight,
      child: ElevatedButton(onPressed: (){}, child: const Text("다음")),
    );

    var nickName = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: const Text(
            "닉네임을 입력해주세요.",
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '닉네임',
            )
          ),
        ),
      ]
    );

    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: nickName, flex: 2,),
            Expanded(child: button, flex: 1,)
          ],
        ),
      )
    );
  }
  
}