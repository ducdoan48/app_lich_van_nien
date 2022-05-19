// ignore_for_file: use_key_in_widget_constructors, must_call_super

import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:app_lich_van_nien/components/calendar/day_of_week.dart';
import 'package:app_lich_van_nien/components/calendar/header.dart';
import 'package:app_lich_van_nien/components/calendar/utils.dart';
import 'package:app_lich_van_nien/presentation/widgets/SwipeDetector.dart';
import 'package:flutter/material.dart';


class Calendar extends StatefulWidget {
 

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar>  with TickerProviderStateMixin  {

  DateTime calendar = DateTime.now();

  //animation
  late AnimationController _controller;
  late Animation<Offset> _offsetFloat;



  @override
  void initState() {
    calendar = DateTime.now();
//animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _offsetFloat = Tween<Offset>(begin: Offset(1, 0.0), end: Offset.zero)
        .animate(_controller);

    _controller.forward();
  
  }

// get thông tin thứ 2, 3, 4, 5... của thanh header
Widget getDateOfWeakHeader(daywidth) {
List<Widget> listDay = []; //  mảng rỗng
for(int i=0; i< days.length; i++){ // duyệt số lượng ptu trong mảng const days 
  listDay.add(DayOfWeek(days[i],daywidth));
}
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: listDay,
);
}

Widget getMonthComponent(context){
  var width = MediaQuery.of(context).size.width;//mediaQuery.of thiết kế bố cục phù hợp
var daywith = width / 7;
List<Widget> columItems = [
  getDateOfWeakHeader(daywith),
];
return SlideTransition(
position: _offsetFloat,
child: SwipeDetector(
  
  child: Column(
    children: columItems,
  ),
  onSwipeLeft: (){
onPreviousPress();
  },
  onSwipeRight: (){
    onNextPress();
  },
));

}


  onPreviousPress() {
    var newCalendar = decreaseMonth(calendar);
    setState(() {
      calendar = newCalendar;
    });
    
  }

  onNextPress() {
    var newCalendar = increaseMonth(calendar);
    setState(() {
      calendar = newCalendar;
    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Header(
          currentMonth: calendar, onNextPress: onNextPress, onPreviousPress: onPreviousPress,
        
        ),
     getMonthComponent(context),
      ],
    );
  }
}
