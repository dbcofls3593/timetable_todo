import 'package:flutter/material.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/timetableSource/myLecture.dart';

class UpdateLecture extends StatefulWidget {
  @override
  State<UpdateLecture> createState() => _UpdateLectureState();
}

class _UpdateLectureState extends State<UpdateLecture> {
  final TextEditingController newSubjectsController = TextEditingController();
  final TextEditingController newProfessorController = TextEditingController();
  final TextEditingController newPlaceController = TextEditingController();

  final List<int> _newStartList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _newSelectedValue1 = 1;

  final List<int> _newEndList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _newSelectedValue2 = 1;

  final List<String> _newDateList = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
  String _newSelectedDateValue = '월요일';

  Color newColorname = Color(0xff92AE9F);

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
                    controller: newSubjectsController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '교수명'),
                    style: TextStyle(fontWeight : FontWeight.bold),
                    keyboardType: TextInputType.text,
                    controller: newProfessorController,
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
                              value: _newSelectedDateValue,
                              items: _newDateList.map((days){
                                return DropdownMenuItem(
                                  value: days,
                                  child: Text(days),
                                );
                              }).toList(),
                              onChanged: (dynamic days){
                                setState((){
                                  _newSelectedDateValue = days;
                                });
                              },
                            )
                        ),
                      ),
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: DropdownButton<int>(
                              value: _newSelectedValue1,
                              items: _newStartList.map((startclass){
                                return DropdownMenuItem(
                                  value: startclass,
                                  child: Text('$startclass교시'),
                                );
                              }).toList(),
                              onChanged: (dynamic startclass){
                                setState((){
                                  _newSelectedValue1 = startclass;
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
                              value: _newSelectedValue2,
                              items: _newEndList.map((endclass){
                                return DropdownMenuItem(
                                  value: endclass,
                                  child: Text('$endclass교시'),
                                );
                              }).toList(),
                              onChanged: (dynamic endclass){
                                setState((){
                                  _newSelectedValue2 = endclass;
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
                    controller: newPlaceController,
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
                                value: 1,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffFD9D9D)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffFD9D9D);
                                  });
                                }),
                            Radio(
                                value: 2,
                                //groupValue: _colorSelect,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffD5EFD0)),
                                onChanged: (val){
                                  setState((){
                                    //_colorSelect = 2;
                                    newColorname = Color(0xffD5EFD0);
                                  });
                                }),
                            Radio(
                                value: 3,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffA2DBD1)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffA2DBD1);
                                  });
                                }),
                            Radio(
                                value: 4,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffEBB889)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffEBB889);
                                  });
                                }),
                            Radio(
                                value: 5,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xff92AE9F)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xff92AE9F);
                                  });
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: 7,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffB1CEFB)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffB1CEFB);
                                  });
                                }),
                            Radio(
                                value: 8,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffDAB1FB)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffDAB1FB);
                                  });
                                }),
                            Radio(
                                value: 9,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffB1E9FB)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffB1E9FB);
                                  });
                                }),
                            Radio(
                                value: 10,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xffffcc00)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xffffcc00);
                                  });
                                }),
                            Radio(
                                value: 11,
                                groupValue: newColorname,
                                fillColor : MaterialStateColor.resolveWith((states) => Color(0xff7fc638)),
                                onChanged: (val){
                                  setState((){
                                    newColorname = Color(0xff7fc638);
                                  });
                                }),
                          ],
                        )

                      ],
                    ),
                  ),
                ],
              )
          ),
        ),

        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();

                return setState(() {
                  lectures[0].subjects = newSubjectsController.text;

                  subjectsController.clear();
                  professorController.clear();
                  //_selectedDateValue.clear();
                  //_selectedValue1.clear();
                  //_selectedValue2.clear();
                  placeController.clear();

                });
              },
              child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold))
          )
        ]
    );
  }


}
