// ignore_for_file: unused_field

// import 'package:app_lich_van_nien/components/calendar/calendar.dart';
// import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:flutter/material.dart';

class MonthContainer extends StatefulWidget {
  const MonthContainer({Key? key}) : super(key: key);

  

  @override
  State<MonthContainer> createState() => _MonthContainerState();
}

class _MonthContainerState extends State<MonthContainer>
 {
  // final List<EventVO> _eventData = [];
  // final List<EventVO> _eventByMonths = [];
  // final List<DateTime> _markedDates = [];
  // final DateTime _calendar = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
     
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image_background.jpg"),
            fit: BoxFit.cover,
          
          ),
        ),
       
    );
  }
}