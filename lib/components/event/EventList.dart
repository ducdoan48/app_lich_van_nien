import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:flutter/material.dart';
import 'EventItem.dart';


class EventList extends StatelessWidget {
  EventList({required this.data});
  final List<EventVO> data;

  Widget renderItem(EventVO event) {
    return EventItem(event);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:480,
        color: Colors.black.withOpacity(0.5),
      
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return renderItem(data[index]);
          },
        ),
      ),
<<<<<<< HEAD
=======
=======
    return  ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, int index) {
        return renderItem(data[index]);
      },
>>>>>>> c3ac15c772941ca9c582def2cc3fc18e45face71
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
    );
  }

}