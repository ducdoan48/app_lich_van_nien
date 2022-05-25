// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:flutter/material.dart';

class DayOfWeek extends StatelessWidget {
  const DayOfWeek(this.title, this.width);

  final String title;
  final double width;
  Widget infoBox(Widget widget, bool hasBorder) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey))),
        child: widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return infoBox(
        Container(
          color: Color.fromARGB(255, 219, 197, 197),
          width: width,
          height: 40,
          child: Center(
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: DOW_TEXT_SIZE,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        true);
  }
}
