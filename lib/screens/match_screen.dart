import 'package:dream/data/model/match.dart';
import 'package:flutter/material.dart';

import 'match_screen_body.dart';

class MatchScreen extends StatelessWidget {
  final MatchDto match;
  MatchScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text("Soccer Dream"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: MatchScreenBody(match: match,),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
