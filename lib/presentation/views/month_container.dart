// ignore_for_file: unused_field, must_call_super, non_constant_identifier_names

// import 'package:app_lich_van_nien/components/calendar/calendar.dart';
// import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/components/calendar/calendar.dart';
import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:flutter/material.dart';

class MonthContainer extends StatefulWidget {
  const MonthContainer({Key? key}) : super(key: key);

  @override
  State<MonthContainer> createState() => _MonthContainerState();
}

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
class _MonthContainerState extends State<MonthContainer> {
  final List<DateTime> _markedDates = [];
  List<EventVO> _eventData = [];
  late DateTime _calendar = DateTime.now();
<<<<<<< HEAD

  @override
  void initState() {
    super.initState();
    _getData();
  }

//get nội dung sự kiện
  _getData() async {
    var data = await loadEventData();
    setState(() {
      _eventData = data;
    });

    generate_markedDates();
  }

  generate_markedDates() {
    for (var event in _eventData) {
      // duyệt sự kiện trong mảng _eventData[]
      _markedDates.add(event.date); //thêm nội dung vào ngày nào có sự kiện
    }
  }
=======
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf

  @override
  void initState() {
    super.initState();
    _getData();
  }

//get nội dung sự kiện
  _getData() async {
    var data = await loadEventData();
    setState(() {
      _eventData = data;
    });

    generate_markedDates();
  }

  generate_markedDates() {
    for (var event in _eventData) {
      // duyệt sự kiện trong mảng _eventData[]
      _markedDates.add(event.date); //thêm nội dung vào ngày nào có sự kiện
    }
  }
=======
class _MonthContainerState extends State<MonthContainer> 
 with AutomaticKeepAliveClientMixin<MonthContainer>{
  final List<DateTime> _markedDates = [];
  List<EventVO> _eventData = [];
  late DateTime _calendar = DateTime.now();
>>>>>>> c3ac15c772941ca9c582def2cc3fc18e45face71

  @override
  void initState() {
    super.initState();
    _getData();
  }

//get nội dung sự kiện
  _getData() async {
    var data = await loadEventData();
    setState(() {
      _eventData = data;
    });
   
    generate_markedDates();
  }

  generate_markedDates() {
    for (var event in _eventData) {
      // duyệt sự kiện trong mảng _eventData[]
      _markedDates.add(event.date); //thêm nội dung vào ngày nào có sự kiện
    }
  }
 
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("hinh_nen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 60),
          child: SingleChildScrollView(
            child: Calendar(
              markedDays: _markedDates,
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
              onDateTimeChanged: (newDate) {
                setState(() {
                  _calendar = newDate;
                });
              },
            ),
          ),
        )
        );
  }
<<<<<<< HEAD
=======
=======
                onDateTimeChanged: (newDate) {
                  setState(() {
                    _calendar = newDate;
                  });
                  
                },
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;


>>>>>>> c3ac15c772941ca9c582def2cc3fc18e45face71
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
}
