import 'package:dream/components/form_component.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

  checkIsValidThenCreateUser(){
    print(name);
    print(email);
    // createUser();
    if (_formKey.currentState?.validate() ?? false) {
      // 유효성 검사 통과 시 여기에 추가 로직을 넣을 수 있습니다.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('처리 중입니다.')),
      );
    } else {
      String message = email.isEmpty ? "이메일을 입력해주세요" : "닉네임을 입력해주세요";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  createUser() async {
    // 계정 생성 api 호출
    int userId = 1;

    // 계정 Local 저장
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", userId);
    prefs.setString("email", email);
    prefs.setString("name", name);

    // 화면 전환
  }
}