// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/core/utility.dart';
import 'package:app_lich_van_nien/data/models/QuoteVO.dart';
import 'package:app_lich_van_nien/components/Stroxtext.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleDayContainer extends StatefulWidget {
  const SingleDayContainer({Key? key}) : super(key: key);

  @override
  State<SingleDayContainer> createState() => _SingleDayContainerState();
}

class _SingleDayContainerState extends State<SingleDayContainer> {
  List<QuoteVO> _quoteData = [];
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getData() async {
    var data = await loadQuoteData();
    setState(() {
      _quoteData = data;
    });
  }

  // _onSwipeLeft() {
  //   _controller.value = 0.8;
  //   _controller.forward();
  //   setState(() {
  //     _selectedDate = decreaseDay(_selectedDate);
  //   });
  // }

  // _onSwipeRight() {
  //   _controller.value = 0.8;
  //   _controller.forward();
  //   setState(() {
  //     _selectedDate = increaseDay(_selectedDate);
  //   });
  // }

  _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        //'DateTime?' is nullable and 'DateTime' isn't.
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(2100));

    // nếu ngày đc chọn khác null và khác ngày htai
    // thì chuyển ngày htai thành ngày đc chọn
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // khai báo biến top kiểu double, xong dưới top: top để thay đổi khoảng cách tùy ý
  // //Widget paddingText( String text, TextStyle style){
//     return Padding(
//       padding: const EdgeInsets.only(top: 5, left: 10, right: 20), cố định top
//       child: Text(text, style: style),
//     );
//   }
  Widget paddingText(double top, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: 40, right: 30),
      child: Text(text, style: style), //truyền text và style vào ko bị cố định
    );
  }

  Widget getHeader() {
    var title = 'Tháng ${_selectedDate.month} - ${_selectedDate.year}';

    var todayStyle =
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:18);

    return Positioned(
      top: 40,
      left: 10,
      right: 10,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              //SelectDateButton ycau 2 tham số (title, onpress)
              child: SelectDateButton(
                title: title,
                onPress: () {
                  _showDatePicker(context);
                },
              )),
          Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: 40,
                  width: 100,
                  child: GestureDetector(
                    //click vào sẽ trở lại tgian ngày hnay
                    onTap: () {
                      setState(() {
                        _selectedDate = DateTime.now();
                      });
                    },
                    child: Center(
                      child: Text(
                        "Hôm Nay",
                        style: todayStyle,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget getMainDate() {
    var dayOfWeek = getNameDayofWeek(_selectedDate);
    var quote = QuoteVO(" ", " "); //khởi tạo quote = rỗng
    if (_quoteData.isNotEmpty) {
      // nếu mảng rỗng ban đầu mà có gtri thì quoute rỗng = mảng rỗng ban đầu có gtri
      quote = _quoteData[_selectedDate.day % _quoteData.length];
    }
    const dayOfWeekStyle = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    );

    const quoteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
    const quoteAuthorStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return Expanded(
      // child: SwipeDetector(
      // onSwipeRight: () {
      //   _onSwipeRight();
      // },
      // onSwipeLeft: () {
      //   _onSwipeLeft();
      // },
      child: (Stack(
        children: <Widget>[
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/image_2.jpg'),
              fit: BoxFit.cover,
              width: 900,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: StrokeText(
                    _selectedDate.day.toString(),
                    strokeWidth: 3,
                    fontSize: 120,
                    color: Colors.red,
                    strokeColor: Colors.white,
                  ),
                ),
                paddingText(0, dayOfWeek, dayOfWeekStyle), //thứ

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: paddingText(20, quote.content, quoteStyle),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: paddingText(20, quote.author, quoteAuthorStyle),
                  ),
                ),
                SizedBox(
                  child: getBarInfo(),
                ),

                Expanded(
                  child: getDateInfo(),
                )
              ],
            ),
          ),
          getHeader(),
        ],
      )),
    );
  }

  Widget infoBox(Widget widget) {
    return Expanded(
      child: (Container(
        padding: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
            border: Border(
                right:
                    BorderSide(color: Colors.grey))),
        child: widget,
      )),
    );
  }
  Widget getDateInfo() {
    var hourStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
  
    var lunarStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
    var hourMinute = '${_selectedDate.hour} : ${_selectedDate.minute}';

    return Container(
        color: Colors.black.withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            infoBox( Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(hourMinute, style: hourStyle),
                Text('Giáp Tí', style: hourStyle),
              ],
            ),),
           infoBox( Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                  StrokeText(
                    '15',
                    strokeWidth: 1,
                    fontSize: 60,
                    color: Colors.red,
                    strokeColor: Colors.white,
                  ),
              ],
            ),),
           infoBox(Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('8:20', style: lunarStyle),
                Text('Giáp Tí', style: lunarStyle),
              ],
            )),
            
          ],
        ));
  }

  Widget getBarInfo() {
    var hourStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
    var monthStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    var lunarStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

    return SizedBox(
      height: 40,
      child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Giờ ', style: hourStyle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Tháng ${_selectedDate.month}', style: monthStyle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Âm lịch', style: lunarStyle),
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      getMainDate(),
    ]);
  }
}

mixin Font {}

// button chọn ngày
class SelectDateButton extends StatelessWidget {
  const SelectDateButton({required this.title, required this.onPress});
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 40,
        width: 190,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
              color: Colors.white, width: 1.0, style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text(title, style: textStyle)), //title: tháng-năm
            const Icon(
              Icons.arrow_drop_down,
              size: 30,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
