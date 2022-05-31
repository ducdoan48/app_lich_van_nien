<<<<<<< HEAD
// ignore_for_file: use_key_in_widget_constructors

=======
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
import 'package:flutter/material.dart';


class Dot extends StatelessWidget {
<<<<<<< HEAD
  const Dot(this.isShow, this.color); // có 2 tham số là isShow và color
=======
  Dot(this.isShow, this.color); // có 2 tham số là isShow và color
>>>>>>> aa2bf2550482c05de98a2e90a0a58e56ebbb2aaf
  final bool isShow;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 6,
      height: 6,
      decoration: isShow ? BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ) : null,
    );
  }
}