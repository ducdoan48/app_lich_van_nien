import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:flutter/material.dart';


class Day extends StatelessWidget {
  final double width;
  final DateTime date;
  final DateTime selectedDate;
  final DateTime currentCalendar;
  final Function onDayPress;
  final List<DateTime> markedDays;

  Day({
    required this.width,
    required this.date,
    required this.currentCalendar,
    required this.selectedDate,
    required this.onDayPress,
    required this.markedDays,
  });

  bool checkMarked() {
    bool marked = false;
    markedDays.forEach((DateTime element) {
      if (element.day == date.day && element.month == date.month) {
        marked = true;
      }
    });
    return marked;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DateTime now = DateTime.now();
    //box color, text color
    var textColor = DAY_TEXT_NORMAL;

    var dayStyle =
        TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.bold);

    return GestureDetector(
        onTap: () {
          onDayPress(date);
        },
        child: Container(
            padding: EdgeInsets.all(6),
            child: Stack(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        date.day.toString(),
                        style: dayStyle,
                        textAlign: TextAlign.center,
                      ),
                    
                    ],
                  ),
                 
                ),
               
              ],
            ),
            width: width,
            height: width));
  }
}
