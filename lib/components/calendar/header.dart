
import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({required this.currentMonth, required this.onPreviousPress, required this.onNextPress});
  final DateTime currentMonth;
  final Function onPreviousPress;
  final Function onNextPress;
  @override
  Widget build(BuildContext context) {
    var month = currentMonth.month;
    var year = currentMonth.year;
    var title = '${months[month - 1]}-$year'.toUpperCase();
    const titleStyle = TextStyle(
      color: Colors.white,
     
      fontSize: 20
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_left),
          iconSize: 30,
          color: Colors.white,
          onPressed: () {
            onPreviousPress();
          },
        ),
        Text(title, style: titleStyle),
        IconButton(
          icon: const Icon(Icons.arrow_right),
          iconSize: 30,
          color: Colors.white,
          onPressed: () {
            onNextPress();
          },
        ),
      ],
    );
  }
}