import 'package:app_lich_van_nien/data/models/QuoteVO.dart';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;
Future<String> loadAssets(name) async {
  return await rootBundle.loadString(name);
}
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