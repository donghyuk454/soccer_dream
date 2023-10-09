import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ScheduleBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const ScheduleBanner({super.key, required this.scheduleCount, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${selectedDay.year}년'
                  '${selectedDay.month}월'
                  '${selectedDay.day}일',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}