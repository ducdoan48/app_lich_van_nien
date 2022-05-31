// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:app_lich_van_nien/data/models/WeatherLocations.dart';
import 'package:app_lich_van_nien/presentation/widgets/Single_weather.dart';
import 'package:app_lich_van_nien/presentation/widgets/Slider_dot.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  int _currentPage = 0;
  late String bgImg;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  var headerStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  Widget getWeatherHeader() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            color: Colors.black.withOpacity(0.8),
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.white,
                      )),
                ),
                Text('THỜI TIẾT', style: headerStyle),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      onPressed: () => {print('anh nho em')},
                      icon: const Icon(
                        Icons.menu,
                        size: 20,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getMain() {
    return Expanded(
      child: (Stack(
        children: <Widget>[
          Positioned.fill(
            //Widget Positioned được sử dụng để định vị cho một widget con của một Stack.
            child: Image(
              image: AssetImage(bgImg),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  Container(
                      decoration: const BoxDecoration(color: Colors.black38)),
                  Container(
                      margin: const EdgeInsets.only(top: 100, left: 15),
                      child: Row(
                        children: [
                          for (int i = 0; i < locationList.length; i++)
                            if (i == _currentPage)
                              SliderDot(true)
                            else
                              SliderDot(false)
                        ],
                      )),
                  Scrollbar(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                      itemCount: locationList.length,
                      itemBuilder: (c, i) => SingleWeather(i),
                    ),
                  )
                ],
              )),
          getWeatherHeader(),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (locationList[_currentPage].weatherType == 'Sunny') {
      bgImg = 'img_3.jpg';
    } else if (locationList[_currentPage].weatherType == 'Night') {
      bgImg = 'img_4.jpg';
    } else if (locationList[_currentPage].weatherType == 'Rainy') {
      bgImg = 'img_2.jpg';
    } else if (locationList[_currentPage].weatherType == 'Cloudy') {
      bgImg = 'img_1.jpeg';
    }
    return Column(
      children: [
        getMain(),
      ],
    );
  }
}


//flutter run --no-sound-null-safety
