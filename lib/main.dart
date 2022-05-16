import 'package:app_lich_van_nien/components/bottom_tabs/BottomTab.dart';
import 'package:app_lich_van_nien/data/models/TabItemData.dart';
import 'package:app_lich_van_nien/presentation/views/single_day_container.dart';
import 'package:flutter/material.dart';





void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> tabs = [
   const SingleDayContainer()
   
  ];

  void onTabTapped(int index) {
    // ignore: avoid_print
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
            IndexedStack(
              index: _currentIndex,
              children: <Widget>[
                ...tabs
              ],
            ),
             BottomTab(
                  currentIndex: _currentIndex,
                  onTabTapped: (){},
                  items: [
                    TabItemData(
                        index: 0,
                        title: "Ngày",
                        image: "calendar_day.png"),
                    TabItemData(
                        index: 1,
                        title: "Tháng",
                        image: "calendar_month.png"),
                    TabItemData(
                        index: 2, 
                        title: "Tử vi", 
                        image: "tv.png"),
                    TabItemData(
                        index: 3, 
                        title: "Mở rộng", 
                        image: "menu.png")
                  ],
                )
                // new
               
              ],
            ),
            bottom: true,
            top: false));
  }
}
