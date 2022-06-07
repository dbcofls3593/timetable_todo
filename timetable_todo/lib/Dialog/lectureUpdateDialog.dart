import 'package:flutter/material.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';
import 'package:timetable_todo/main.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/timetableSource/myLecture.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';

class UpdateDialog extends StatefulWidget {
  // final List<Detail> lectures;
  final Detail lecture;
  final TextEditingController subjectsController;
  final TextEditingController professorController;
  final TextEditingController placeController;
  int selectedValue1 = 1;
  int selectedValue2 = 1;
  String selectedDateValue = '월요일';
  Color newColorname = Color(0xffFD9D9D);

  UpdateDialog({Key? key,required this.lecture, required this.subjectsController,required this.professorController,required this.placeController,required this.selectedDateValue,required this.selectedValue1,required this.selectedValue2,required this.newColorname}) : super(key: key);
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}


class _MyAlertDialogState extends State<UpdateDialog> {

  final List<int> _startList = [1, 2, 3, 4, 5, 6, 7, 8, 9];


  final List<int> _endList = [1, 2, 3, 4, 5, 6, 7, 8, 9];


  final List<String> _dateList = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];

  int id=1;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
        title: Text('수업 수정', style: TextStyle(fontWeight : FontWeight.bold)),
        content:
        Container(
          width: 500,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: '수업명'),
                    style: TextStyle(fontWeight : FontWeight.bold),
                    keyboardType: TextInputType.text,
                    controller: widget.subjectsController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '교수명'),
                    style: TextStyle(fontWeight : FontWeight.bold),
                    keyboardType: TextInputType.text,
                    controller: widget.professorController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children: [
                        Text("시간", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Container(
                            child: DropdownButton<String>(
                              value: widget.selectedDateValue,
                              items: _dateList.map((days){
                                return DropdownMenuItem(
                                  value: days,
                                  child: Text(days),
                                );
                              }).toList(),
                              onChanged: (dynamic days){
                                setState((){
                                  widget.selectedDateValue = days;
                                });
                              },
                            )
                        ),
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: DropdownButton<int>(
                              value: widget.selectedValue1,
                              items: _startList.map((startclass){
                                return DropdownMenuItem(
                                  value: startclass,
                                  child: Text('$startclass교시'),
                                );
                              }).toList(),
                              onChanged: (dynamic startclass){
                                setState((){
                                  widget.selectedValue1 = startclass;
                                });
                              },
                            ),
                          )
                      ),
                      Text(" 부터 "),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: DropdownButton<int>(
                              value: widget.selectedValue2,
                              items: _endList.map((endclass){
                                return DropdownMenuItem(
                                  value: endclass,
                                  child: Text('$endclass교시'),
                                );
                              }).toList(),
                              onChanged: (dynamic endclass){
                                setState((){
                                  widget.selectedValue2 = endclass;
                                });
                              },
                            ),
                          )
                      ),

                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '장소'),
                    style: TextStyle(fontWeight : FontWeight.bold),
                    keyboardType: TextInputType.text,
                    controller: widget.placeController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      children:[
                        Text('색상', style: TextStyle(fontWeight : FontWeight.bold, color: Colors.black54)),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 1, //groupValue: _colorSelect,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffFD9D9D)),
                                onChanged: (val){
                                  setState((){ //_colorSelect = 2;
                                    widget.newColorname= Color(0xffFD9D9D);
                                    id = 1;
                                  });
                                }),
                            Radio(
                                value: 2, //groupValue: _colorSelect,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffD5EFD0)),
                                onChanged: (val){
                                  setState((){
                                    //_colorSelect = 2;
                                    widget.newColorname= Color(0xffD5EFD0);
                                    id = 2;
                                  });
                                }),
                            Radio(
                                value: 3,
                                groupValue: id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffA2DBD1)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xffA2DBD1);
                                    id = 3;
                                  });
                                }),
                            Radio(
                                value: 4,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffEBB889)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xffEBB889);
                                    id = 4;
                                  });
                                }),
                            Radio(
                                value: 5,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xff92AE9F)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xff92AE9F);
                                    id = 5;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 6,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffB1CEFB)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xffB1CEFB);
                                    id = 6;
                                  });
                                }),
                            Radio(
                                value: 7,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffDAB1FB)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xffDAB1FB);
                                    id = 7;
                                  });
                                }),
                            Radio(
                                value: 8,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffB1E9FB)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xffB1E9FB);
                                    id = 8;
                                  });
                                }),
                            Radio(
                                value: 9,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffffcc00)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xffffcc00);
                                    id = 9;
                                  });
                                }),
                            Radio(
                                value: 10,
                                groupValue:id,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xff7fc638)),
                                onChanged: (val){
                                  setState((){
                                    widget.newColorname= Color(0xff7fc638);
                                    id = 10;
                                  });
                                }),
                          ],
                        )

                      ],
                    ),
                  )
                ],
              )
          ),
        ),

        actions: <Widget>[
          TextButton(
              onPressed: () {
                setState(() {
                  widget.lecture.color = widget.newColorname;
                  widget.lecture.subjects = widget.subjectsController.text;
                  widget.lecture.days = widget.selectedDateValue;
                  widget.lecture.start = widget.selectedValue1;
                  widget.lecture.end = widget.selectedValue2;
                  widget.lecture.place = widget.placeController.text;
                  widget.subjectsController.clear();
                  widget.professorController.clear();
                  widget.placeController.clear();

                });
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold))
          )
        ]
    );
  }
}
