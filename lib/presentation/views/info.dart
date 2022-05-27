import 'package:flutter/material.dart';
import 'dart:async' show Future;


class InfoContainer extends StatefulWidget {
  @override
  State createState() {
    return _InfoContainerState();
  }
}

class _InfoContainerState extends State<InfoContainer> {
  var _version = "";
  var _buildNumber = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
    var versionStyle = const TextStyle(color: Colors.white, fontSize: 15);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("hinh_nen.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 90,
          ),
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Lịch Vạn Niên 2022",
            style: textStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'Version: $_version',
              style: versionStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              'Build: $_buildNumber',
              style: versionStyle,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 70, right: 10),
                    child: Text("Developed by DoanDuc"))),
          )
        ],
      ),
    );
  }

  
  }

