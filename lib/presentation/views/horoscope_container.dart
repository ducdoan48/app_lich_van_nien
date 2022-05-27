
import 'package:app_lich_van_nien/components/horoscope/horoscope.dart';
import 'package:flutter/material.dart';

class HoroscopeContainer extends StatefulWidget {
  const HoroscopeContainer({ Key? key }) : super(key: key);

  @override
  State<HoroscopeContainer> createState() => _HoroscopeContainerState();
}

class _HoroscopeContainerState extends State<HoroscopeContainer> {
  int _currentIndex = 0; // page default là 0
  final List<Widget> tabs = [
    
  ];

   onTabTapped(int index) {
    // ignore: avoid_print

    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("hinh_nen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 60),
          child: Horoscope(
          
          ),
        )
       );
  }
}
