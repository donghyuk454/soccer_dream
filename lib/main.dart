import 'package:dream/components/korean_drawer.dart';
import 'package:dream/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'data/model/match.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<MatchDto>> matches = {};
    matches.addAll({
      DateTime.utc(2023, 10, 23): [MatchDto("토트넘 vs 리버풀", "2023-10-23"), MatchDto("울버햄튼 vs 아스날", "2023-10-23"), MatchDto("마인츠 vs 바이에른뮌헨", "2023-10-23"), MatchDto("토트넘 vs 리버풀", "2023-10-23"),MatchDto("토트넘 vs 리버풀", "2023-10-23"),],
      DateTime.utc(2023, 10, 24): [MatchDto("셀틱FC vs 어쩌구", "2023-10-24")],
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: Text("Soccer Dream"),
        ),
        body: HomeScreen(matches: matches,),
        bottomNavigationBar: BottomAppBar(),
        drawer: Drawer(
          child: KoreanDrawer()
        ),
      )
    );
  }
}