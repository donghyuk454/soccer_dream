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
    var result = Column(children: [],);

    for (var match in widget.matches) {
      result.children.add(MatchView(match.getTitle(), match.getTime()));
    }

    return result;
  }
}