// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:flutter/material.dart';


class EventItem extends StatelessWidget {
  const EventItem(this.event);

  final EventVO event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const titleStyle = TextStyle(color: Colors.white);
    const contentStyle = TextStyle(color: Colors.white);
    var title = '* ${event.date.day}/${event.date.month} ';
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                ),
            child: Text(title, style: titleStyle),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Text(event.event, style: contentStyle),
          )
        ],
      ),
    );
  }
}
