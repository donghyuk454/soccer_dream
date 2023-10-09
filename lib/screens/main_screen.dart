import 'package:dream/components/banner.dart';
import 'package:dream/components/match_list_view.dart';
import 'package:dream/data/model/match.dart';
import 'package:flutter/material.dart';

import 'package:dream/components/calender.dart';

class HomeScreen extends StatefulWidget {
  Map<DateTime, List<MatchDto>>? matches;

  HomeScreen({super.key, this.matches});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime focusedDay = DateTime.now();
  // Map<DateTime, List<MatchDto>> matches = {};
  List<MatchDto> nowMatches = [];

  @override
  Widget build(BuildContext context) {

    MatchListView matchListView = MatchListView(matches: nowMatches);

    return SafeArea(
      child: Scaffold(
          body: Column(children: [
            SoccerCalendar(
              onDaySelected: onDaySelected,
              focusedDay: focusedDay,
              selectedDay: selectedDay,
              matchEventLoader: _getMatchesForDay,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ScheduleBanner(scheduleCount: 0, selectedDay: selectedDay,),
            matchListView,
          ])
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
      nowMatches = _getMatchesForDay(selectedDay);
    });
  }

  List<MatchDto> _getMatchesForDay(DateTime day) {
    return widget.matches![day] ?? [];
  }
}