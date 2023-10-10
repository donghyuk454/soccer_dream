import 'package:dream/data/model/match.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SoccerCalendar extends StatefulWidget {

  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  void Function(DateTime, DateTime)? onDaySelected;
  List<MatchDto> Function(DateTime)? matchEventLoader;

  SoccerCalendar({super.key, this.selectedDay, required this.focusedDay, this.onDaySelected, required this.matchEventLoader}) : super();

  @override
  State<SoccerCalendar> createState() => _SoccerCalendarState();
}

class _SoccerCalendarState extends State<SoccerCalendar> {
  @override
  Widget build(BuildContext context) {

    return TableCalendar<MatchDto>(
      focusedDay: widget.focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700)),
      onDaySelected: widget.onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (widget.selectedDay == null) {
          return false;
        }

        return date.year == widget.selectedDay!.year &&
            date.month == widget.selectedDay!.month &&
            date.day == widget.selectedDay!.day;
      },
      eventLoader: widget.matchEventLoader,
      calendarBuilders: CalendarBuilders(
        singleMarkerBuilder: (context, datetime, match) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: match.color,
              ),
              height: 10,
              width: 10,
            ),
          );
        }
      ),
    );
  }
}