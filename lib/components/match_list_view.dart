import 'package:dream/components/match_view.dart';
import 'package:dream/data/model/match.dart';
import 'package:flutter/material.dart';

class MatchListView extends StatefulWidget {
  List<MatchDto> matches = [];

  MatchListView({super.key, required this.matches}) : super();

  @override
  State<MatchListView> createState() => _MatchListViewState();
}

class _MatchListViewState extends State<MatchListView> {

  @override
  Widget build(BuildContext context) {
    List<MatchView> components = [];

    for (var match in widget.matches) {
      components.add(MatchView(match));
    }

    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: components.length,
        itemBuilder: (BuildContext context, int index) {
          return components[index];
        },
      ),
    );
  }
}