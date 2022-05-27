import 'package:app_lich_van_nien/components/horoscope/horoscopedetails/barheader.dart';
import 'package:app_lich_van_nien/presentation/widgets/HCSelectedDateButton.dart';
import 'package:flutter/material.dart';

class ContentDaily extends StatefulWidget {
  const ContentDaily({ Key? key }) : super(key: key);

  @override
  State<ContentDaily> createState() => _ContentDailyState();
}

class _ContentDailyState extends State<ContentDaily> {

   @override
  void dispose() {
    super.dispose();
  }


  Widget getHeader() {
    
  
    return SizedBox(
        height:40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                  alignment: Alignment.center,
                  //SelectDateButton ycau 2 tham số (title, onpress)
                  child: HCSelectDateButton(
                    title: 'Nam', onPress: (){},
                  )),
                  Align(
                  alignment: Alignment.center,
                  //SelectDateButton ycau 2 tham số (title, onpress)
                  child: HCSelectDateButton(
                    title: '1990', onPress: (){},
                  )),
            ],
          ),
       
      
    );
  }
  Widget selectLunarDate() {
    var barStyle = const TextStyle(
        color: Colors.yellow, fontSize: 20, );
    return Column(
      children: <Widget>[
        Container(
            width: 500,
            height: 40,
            padding: const EdgeInsets.all(10),
           
            child: Text(
              'CHỌN THEO NĂM ÂM LỊCH',
              style: barStyle,
              textAlign: TextAlign.center,
            )),
      ],
    );
    
  }
   Widget paddingText(double top, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: 40, right: 30),
      child: Text(text, style: style), //truyền text và style vào ko bị cố định
    );
  }
  
  Widget getMainContent(){
      var styleText = const TextStyle(color: Colors.white, fontSize: 15);
    return  Expanded(
      child: (Stack(
        children: <Widget>[
        
          Padding(
            padding: const EdgeInsets.only(top:70.0, left:8.0),
            child: Column(
              children:  <Widget>[
            Text('Vận mệnh Tử vi năm 2022 tuổi Canh Ngọ nam mạng ra sao? \n',style:styleText),
            Text('Ngày nay tồn tại rất nhiều luận giải của nhiều hệ phái Tử Vi không đồng nhất. Điều này cũng giống như quý bạn đi xem thầy thì có thầy nói kiểu này, có thầy lại nói kiểu khác, có thầy nói đúng, có thầy thì nói sai. Nhìn tổng quan thì do kinh nghiệm mỗi người khác nhau, học hỏi ở những sách tử vi khác nhau nên giải luận tử vi cũng khác nhau là điều tất yếu.',style:styleText)
              
              ],
            ),
          ),
          getHeader(),
        ],
      )),

    );
    
  }
  @override 
  Widget build(BuildContext context) {
    return Column(
      children:  <Widget>[
        const BarHeaderDetails(),
       selectLunarDate(),
       getMainContent()
      ],
    );
  }
}