import 'package:flutter/material.dart';

class MatchDto {
  final String title;
  final String time;
  final Color color;
  final String home;
  final String away;
  final DateTime dateTime;

  MatchDto(this.title, this.time, this.color, this.home, this.away, this.dateTime);

  String getTitle() {
    return title;
  }

  String getTime() {
    return time;
  }
}