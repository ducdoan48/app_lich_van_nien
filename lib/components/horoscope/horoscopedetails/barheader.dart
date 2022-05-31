
import 'package:flutter/material.dart';

class BarHeaderDetails extends StatelessWidget {
  const BarHeaderDetails({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
   
    
    const titleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16
    );


    return Container(
      color: Colors.black.withOpacity(0.8),
      height:  45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
        Text('TỬ VI 2022',style: titleStyle),
        
         
        ],
      ),
    );
  }
}