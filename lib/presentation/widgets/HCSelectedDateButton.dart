
// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

// button chọn ngày
class HCSelectDateButton extends StatelessWidget {
  const HCSelectDateButton({required this.title, required this.onPress});
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle
       (color: Color.fromARGB(255, 243, 163, 13), fontSize: 16);
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 40,
        width: 120,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
              color: Colors.white, width: 1.0, style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(child: Text(title, style: textStyle)), //title: tháng-năm
            const Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}