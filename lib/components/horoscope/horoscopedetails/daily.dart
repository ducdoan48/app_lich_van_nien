
import 'package:app_lich_van_nien/components/horoscope/horoscopedetails/content_daily.dart';
import 'package:flutter/material.dart';
class Daily extends StatefulWidget {
  const Daily({ Key? key }) : super(key: key);

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {



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
          child: ContentDaily(
          
          ),
        )
        );
  }
}
// Stack(
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("hinh_nen.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 40.0),
//           child: Column(children:  [
//             const BarHeaderDetails(),
//              SizedBox(
//             width: 500,
//             height: 40,
           
           
//             child: Text(
//               'CHỌN THEO NĂM ÂM LỊCH',
//               style: barStyle,
//               textAlign: TextAlign.center,
//             )),
            
//           ],),
//         ),
        
//       ]
        
         
//     );