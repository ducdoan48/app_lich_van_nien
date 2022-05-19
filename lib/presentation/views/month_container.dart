// ignore_for_file: unused_field, must_call_super

// import 'package:app_lich_van_nien/components/calendar/calendar.dart';
// import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/components/calendar/calendar.dart';
import 'package:flutter/material.dart';

class MonthContainer extends StatefulWidget {
  const MonthContainer({Key? key}) : super(key: key);

  

  @override
  State<MonthContainer> createState() => _MonthContainerState();
}

class _MonthContainerState extends State<MonthContainer>
 with AutomaticKeepAliveClientMixin<MonthContainer> 

 {

  final List<DateTime> _markedDates = [];
  

  @override
  Widget build(BuildContext context) {
    return Container(
     
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image_background.jpg"),
            fit: BoxFit.cover,
          
          ),
        ),
         child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 60),
          child: Column(
            children: <Widget>[
             Calendar(
           
              ),
             
            ],
          ),
        )
       
    );
  }

  @override
  bool get wantKeepAlive => true;
}
