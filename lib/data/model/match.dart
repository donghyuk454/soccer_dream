import 'package:flutter/material.dart';

class MatchDto {
  final String title;
  final String time;
  final Color color;

  MatchDto(this.title, this.time, this.color);

  String getTitle() {
    return title;
  }

  String getTime() {
    return time;
  }
}