import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/data/models/QuoteVO.dart';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;
Future<String> loadAssets(name) async {
  return await rootBundle.loadString(name);
}

//get content thơ + tác giả
Future<List<QuoteVO>> loadQuoteData() async {
  var jsonString = await loadAssets('quotes.json');
  List<QuoteVO> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String content = element['content'];
    String author = element['author'];
    QuoteVO quote = QuoteVO(content, author);
    results.add(quote);
  }
  return results;
}

//get sự kiện
Future<List<EventVO>> loadEventData() async {
  var jsonString = await loadAssets('events.json');
  List<EventVO> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String dateString = element['date'];
    String name = element['name'];
    var dateArr = dateString.split("/");
    var date = DateTime(1993, int.parse(dateArr[1]), int.parse(dateArr[0]));
    EventVO event = EventVO(date, name);
    results.add(event);
  }
  return results;
}
