// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/models/stroxtext.dart';
import 'package:flutter/material.dart';



class SingleDayContainer extends StatefulWidget {
  const SingleDayContainer({Key? key}) : super(key: key);



  @override
  State<SingleDayContainer> createState() => _SingleDayContainerState();
}

class _SingleDayContainerState extends State<SingleDayContainer> {

   DateTime _selectedDate = DateTime.now();

  get bold => null;

 _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

   Widget getHeader(context) {
    var title = 'Tháng ${_selectedDate.month} - ${_selectedDate.year}';
    var todayStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
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
                    onPress: (){
                            _showDatePicker(context);
                  },)
                 
                 ),
          Align(
            alignment: Alignment.topLeft,
              child: SizedBox(
                height: 40,
                  width: 100,
                  child: GestureDetector(
                    //click vào sẽ trở lại tgian ngày hnay
                    onTap: (){
                      setState(() {
                        _selectedDate = DateTime.now();
                      });
                    },
                    child: Center(
                      child: Text("Hôm Nay",
                        style: todayStyle,
                      ),
                    ),
                  ))
          )
        ],
      ),
    );
  }
  Widget getMainDate() {
    return Expanded(
          child: (
             Stack(
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
                      padding: const EdgeInsets.only(top: 100),
                      child: StrokeText(
                        _selectedDate.day.toString(),
                        strokeWidth: 0,
                        fontSize: 120,
                        color: Colors.white,
                        strokeColor: Colors.white,
                      ),
                    ),
                    
                  
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                       
                           
                      ),
                    ),
                   
                  ],
                ),
              ),
              this.getHeader(context),
            ],
          )
          ),
          
        );
      
  
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: <Widget>[
      getMainDate(),
    ]);
  }
}
class SelectDateButton extends StatelessWidget {
const SelectDateButton({required this.title, required this.onPress});

  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
   
    var textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 17,fontWeight: FontWeight.bold
    );
    return GestureDetector(
      onTap: (){
        onPress();
      },
      child: Container(
        height: 40,
        width: 190,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(
              color: Colors.white,
              width: 1.0,
              style: BorderStyle.solid
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text(title, style: textStyle)),
            const Icon(Icons.arrow_drop_down, size: 30, color: Colors.white,)

          ],
        ),
      ),
    );
  }
}
