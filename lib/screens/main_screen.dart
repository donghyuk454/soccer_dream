import 'package:dream/components/banner.dart';
import 'package:dream/components/match_list_view.dart';
import 'package:dream/data/model/match.dart';
import 'package:flutter/material.dart';

import 'package:dream/components/calender.dart';
import 'package:intl/intl.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
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
          ]
        )
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
      nowMatches = _getMatchesForDay(selectedDay);
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0), // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Custom border shape
          ),
          title: Text(DateFormat('MM월 dd일').format(selectedDay)),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MatchListView(matches: nowMatches),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.all(20),
                  child: TextButton(
                    child: Text('닫기'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dialog를 닫습니다.
                    },
                  ),
                )
              ],
            ),
          )
        );
      },
    );
  }

  List<MatchDto> _getMatchesForDay(DateTime day) {
    return widget.matches![day] ?? [];
  }
}