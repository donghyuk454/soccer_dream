import 'package:dream/components/form_component.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
  NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    var button = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () => checkIsValidThenCreateUser(),
        child: const Text("다음")
      ),
    );

    var form = Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FormComponent(
            title: "이메일을 입력해주세요",
            hint: "email",
            errorMessage: "이메일을 입력해주세요",
            onChanged: (text) => email = text
          ),
          FormComponent(
            title: "닉네임을 입력해주세요",
            hint: "닉네임",
            errorMessage: "닉네임을 입력해주세요",
            onChanged: (text) => name = text
          ),
        ]
      )
    );

    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: form, flex: 2,),
            Expanded(child: button, flex: 1,)
          ],
        ),
      )
    );
  }
  
}