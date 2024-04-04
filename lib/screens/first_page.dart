import 'package:dream/data/model/LocalUser.dart';
import 'package:dream/data/model/match.dart';
import 'package:dream/screens/main_screen.dart';
import 'package:dream/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../components/korean_drawer.dart';

class FirstPage extends StatefulWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            centerTitle: true,
            title: Text("Soccer Dream"),
          ),
          body: HomeScreen(),
          bottomNavigationBar: BottomAppBar(),
        )
    );
  }

  @override
  State<StatefulWidget> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  bool isHome = false; // home 만 drawer 존재
  bool isLoading = true;

  Map<DateTime, List<MatchDto>> matches = {};

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    LocalUser localUser = LocalUser();
    localUser.getUser();

    await Future.delayed(Duration.zero);

    setState(() {
      isLoading = false;
    });

    if(localUser.getId() != -1) {
      matches.addAll({
        DateTime.utc(2023, 10, 23): [MatchDto("토트넘 vs 리버풀", "2023-10-23", Colors.blue, "토트넘", "리버풀", DateTime.utc(2023, 10, 23)), MatchDto("울버햄튼 vs 아스날", "2023-10-23", Colors.yellow, "울버햄튼", "아스날", DateTime.utc(2023, 10, 23)), MatchDto("마인츠 vs 바이에른뮌헨", "2023-10-23", Colors.red, "마인츠", "바이에른뮌헨", DateTime.utc(2023, 10, 23))],
        DateTime.utc(2023, 10, 24): [MatchDto("셀틱FC vs 어쩌구", "2023-10-24", Colors.green, "셀틱FC", "어쩌구", DateTime.utc(2023, 10, 24))],
      });
      isLoading = false;
      isHome = true;
    } else {
      isLoading = false;
      isHome = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var loading = Center(child: CircularProgressIndicator());

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            centerTitle: true,
            title: Text("Soccer Dream"),
          ),
          body: isLoading ? loading : (isHome ? HomeScreen(matches: matches,) : SignupScreen()),
          bottomNavigationBar: BottomAppBar(),
          drawer: isHome
              ? Drawer(child: KoreanDrawer())
              : null
        )
    );
  }
}