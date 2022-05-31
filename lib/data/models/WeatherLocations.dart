import 'package:flutter/material.dart';

class WeatherLocation {
  final String city;

  final String temparature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;

  WeatherLocation({
    required this.city,

    required this.temparature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });
}

final locationList = [
  WeatherLocation(
    city: 'Hà Nội',
    temparature: '34°C',
    weatherType: 'Sunny',
    iconUrl: 'sun.svg',
    wind: 10,
    rain: 70,
    humidity: 50,
  ),
  WeatherLocation(
    city: 'Hồ Chí Minh',
    temparature: '15°C',
    weatherType: 'Night',
    iconUrl: 'night.svg',
    wind: 8,
    rain: 7,
    humidity: 82,
  ),
  WeatherLocation(
    city: 'Đà Nẵng',
    temparature: '17°C',
    weatherType: 'Sunny',
    iconUrl: 'sun.svg',
    wind: 5,
    rain: 15,
    humidity: 61,
  ),
  WeatherLocation(
    city: 'Hải Phòng',
    temparature: '10°C',
    weatherType: 'Rainy',
    iconUrl: 'rain.svg',
    wind: 20,
    rain: 70,
    humidity: 91,
  ),
];
