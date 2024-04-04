import 'dart:convert';

import 'package:dream/common/vo/response/response_vo.dart';
import 'package:dream/components/form_component.dart';
import 'package:dream/data/dto/request/add_user_request.dart';
import 'package:dream/screens/first_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String name = "";

  final String url = "http://localhost:8080/api/v1/members";

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

    return Scaffold(
        body: Center(
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
        )
    );
  }

  checkIsValidThenCreateUser(){
    print(name);
    print(email);

    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('처리 중입니다.')),
      );

      createUser();
    } else {
      String message = email.isEmpty ? "이메일을 입력해주세요" : "닉네임을 입력해주세요";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  createUser() async {
    // 계정 생성 api 호출
    ResponseVO? response = await postMember();

    if (response == null) {
      // 통신 에러 발생
      print("등록 실패");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('다시 시도해주세요.')),
      );
      return;
    }
    int userId = 1;

    // 계정 Local 저장
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("id", userId);
    prefs.setString("email", email);
    prefs.setString("name", name);

    // 화면 전환
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstPage())
    );
  }

  Future<ResponseVO?> postMember() async {
    var body = jsonEncode(AddUserRequest(email, name).toJson());
    var headers = {'Content-Type': 'application/json'};

    print(Uri.parse(url));
    print(body);

    try {
      final response = await http.post(
          Uri.parse(url),
          body: body,
          headers: headers
      );

      print(response.statusCode);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var decode = utf8.decode(response.bodyBytes);
        print("response : $decode");
        return ResponseVO.fromJson(json.decode(decode));
      }
    } catch(e) {
      print(e);
    }
    return null;
  }
}