// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:timetable_todo/main.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/timetableSource/myLecture.dart';
import 'package:timetable_todo/timetableSource/myTable.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';
import 'package:timetable_todo/timetableSource/hourTable.dart';

class CreateDialog extends StatefulWidget {
  final TextEditingController subjectsController;
  final TextEditingController professorController;
  final TextEditingController placeController;
  final List<Detail> lectures;
  CreateDialog({Key? key,required this.lectures, required this.subjectsController,required this.professorController,required this.placeController}) : super(key: key);
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}


class _MyAlertDialogState extends State<CreateDialog> {

  final List<int> _startList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _selectedValue1 = 1;

  final List<int> _endList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _selectedValue2 = 1;

  final List<String> _dateList = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
  String _selectedDateValue = '월요일';

  String _colorSelect = 'RED';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              insetPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
              title: Text('수업 추가', style: TextStyle(fontWeight : FontWeight.bold)),
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
                        Row(
                          children: [
                            Text("시간", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: DropdownButton<String>(
                                    value: _selectedDateValue,
                                    items: _dateList.map((days){
                                      return DropdownMenuItem(
                                        value: days,
                                        child: Text(days),
                                      );
                                    }).toList(),
                                    onChanged: (dynamic days){
                                      setState((){
                                        _selectedDateValue = days;
                                      });
                                    },
                                  )
                              ),
                            ),
                            Container(
                                child: DropdownButton<int>(
                                  value: _selectedValue1,
                                  items: _startList.map((startclass){
                                        return DropdownMenuItem(
                                          value: startclass,
                                          child: Text('$startclass교시'),
                                        );
                                      }).toList(),
                                      onChanged: (dynamic startclass){
                                      setState((){
                                        _selectedValue1 = startclass;
                                    });
                                  },
                                )
                            ),
                            Text(" 부터 "),
                            Container(
                                child: DropdownButton<int>(
                                  value: _selectedValue2,
                                  items: _endList.map((endclass){
                                    return DropdownMenuItem(
                                      value: endclass,
                                      child: Text('$endclass교시'),
                                    );
                                  }).toList(),
                                  onChanged: (dynamic endclass){
                                    setState((){
                                      _selectedValue2 = endclass;
                                    });
                                  },
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
                        Row(
                          children:[
                            Text('색상', style: TextStyle(fontWeight : FontWeight.bold, color: Colors.black54)),
                          ],
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: id,
                                  fillColor : MaterialStateColor.resolveWith((states) => Colors.orangeAccent),
                                  onChanged: (val){
                                    setState((){
                                      _colorSelect = 'RED';
                                      id = 1;
                                    });
                                  }),
                              Radio(
                                  value: 2,
                                  groupValue: id,
                                  fillColor : MaterialStateColor.resolveWith((states) => Colors.lime),
                                  onChanged: (val){
                                    setState((){
                                      _colorSelect = 'BLUE';
                                      id = 2;
                                    });
                                  }),
                              Radio(
                                  value: 3,
                                  groupValue: id,
                                  fillColor : MaterialStateColor.resolveWith((states) => Colors.blueGrey),
                                  onChanged: (val){
                                    setState((){
                                      _colorSelect = 'GREEN';
                                      id = 3;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                    value: 4,
                                    groupValue: id,
                                    fillColor : MaterialStateColor.resolveWith((states) => Colors.indigo),
                                    onChanged: (val){
                                      setState((){
                                        _colorSelect = 'YELLOW';
                                        id = 4;
                                      });
                                    }),
                                Radio(
                                    value: 5,
                                    groupValue: id,
                                    fillColor : MaterialStateColor.resolveWith((states) => Colors.brown),
                                    onChanged: (val){
                                      setState((){
                                        _colorSelect = 'LIME';
                                        id = 5;
                                      });
                                    }),
                                Radio(
                                    value: 6,
                                    groupValue: id,
                                    fillColor: MaterialStateColor.resolveWith((states) => Colors.purpleAccent),
                                    onChanged: (val){
                                      setState((){
                                        _colorSelect = 'GREY';
                                        id = 6;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                    value: 7,
                                    groupValue: id,
                                    fillColor : MaterialStateColor.resolveWith((states) => Colors.lightBlueAccent),
                                    onChanged: (val){
                                      setState((){
                                        _colorSelect = 'GREY1';
                                        id = 7;
                                      });
                                    }),
                                Radio(
                                    value: 8,
                                    groupValue: id,
                                    fillColor : MaterialStateColor.resolveWith((states) => Colors.cyan),
                                    onChanged: (val){
                                      setState((){
                                        _colorSelect = 'GREY2';
                                        id = 8;
                                      });
                                    }),
                                Radio(
                                    value: 9,
                                    groupValue: id,
                                    fillColor : MaterialStateColor.resolveWith((states) => Colors.lightGreenAccent),
                                    onChanged: (val){
                                      setState((){
                                        _colorSelect = 'GREY3';
                                        id = 9;
                                      });
                                    }),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                ),
              ),

              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      setState(() {
                        widget.lectures.add(Detail(Colors.yellow, widget.subjectsController.text, widget.professorController.text, "토요일", 4, 8, widget.placeController.text));
                        print(widget.lectures);
                        widget.subjectsController.clear();
                        widget.professorController.clear();
                        //_selectedDateValue.clear();
                        //_selectedValue1.clear();
                        //_selectedValue2.clear();
                        widget.placeController.clear();

                      });
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: "TDD")),
                      );
                      },
                      child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold))
                    )
                  ]
              );
  }
}

