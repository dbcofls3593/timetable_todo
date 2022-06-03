import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';
import './timetableSource/hourTable.dart';
import './timetableSource/myTable.dart';
import './timetableSource/myLecture.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import './Dialog/lectureCreateDialog.dart';
import './todoPage.dart';

class lectureItem{

}

class timetablePage extends StatefulWidget {
  const timetablePage({Key? key}) : super(key: key);

  @override
  State<timetablePage> createState() => _timetablePageState();
}

class _timetablePageState extends State<timetablePage> {

  final List<int> _startList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _selectedValue1 = 1;

  final List<int> _endList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int _selectedValue2 = 1;

  final List<String> _dateList = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
  String _selectedDateValue = '월요일';

  String _colorSelect = 'RED';
  int id = 1;


  final List<Detail> _lectures = <Detail>[];
  final TextEditingController subjectsController = TextEditingController();
  final TextEditingController professorController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10),
                Text('시간표',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.3,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 400,
                        margin: EdgeInsets.fromLTRB(15, 30, 15, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                hourTable("", Colors.transparent,
                                    startnum: 0, endnum: 0, subject: ""),
                                myTable("월", Colors.transparent,
                                    startnum: 1, endnum: 0, subject: ""),
                                myTable("화", Colors.transparent,
                                    startnum: 0, endnum: 0, subject: ""),
                                myTable("수", Colors.transparent,
                                    startnum: 0, endnum: 0, subject: ""),
                                myTable("목", Colors.transparent,
                                    startnum: 0, endnum: 0, subject: ""),
                                myTable("금", Colors.transparent,
                                     startnum: 0, endnum: 0, subject: ""),
                                myTable("토", Colors.transparent,
                                    startnum: 0, endnum: 0, subject: ""),
                                myTable("일", Colors.transparent,
                                    startnum: 0, endnum: 0, subject: ""),

                              ],
                            ),
                            // 강의명, 교수명, 요일, 시작교시, 마지막교시, 장소, 색상

                            Container(
                              child: SizedBox(
                                height: 100,
                                width: 200,
                                child: ListView(
                                  children: _lectures.map((Detail lecture){
                                    return myLecture(context, lecture);
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              )
          )
      ),
      floatingActionButton: FloatingActionButton( // 수업 추가를 위한 플로팅 버튼
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => addDialog() // 플로팅 버튼을 터치했을 때, 수업 추가(addDialog()) 다이얼로그를 보여줌
          );
        },
        child: const Icon(Icons.add,color: Colors.black,size: 30,),
        shape: RoundedRectangleBorder(side: BorderSide(width: 3,color: Colors.black12),borderRadius: BorderRadius.circular(100)),
        ),
    );
  }

  addDialog(){
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
                    controller: subjectsController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: '교수명'),
                    style: TextStyle(fontWeight : FontWeight.bold),
                    keyboardType: TextInputType.text,
                    controller: professorController,
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
                              hint: Text('요일'),
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
                            hint: Text('시작'),
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
                            hint: Text(''),
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
                    controller: placeController,
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
                Navigator.of(context).pop();
                return setState(() {
                  //Detail lecture1 = new Detail(Colors.lightGreenAccent, subjectsController.text, professorController.text, _selectedDateValue, _selectedValue1, _selectedValue2, placeController.text);
                  _lectures.add(Detail(Colors.lightGreenAccent, subjectsController.text, professorController.text, _selectedDateValue, _selectedValue1, _selectedValue2, placeController.text));
                  print('시작교시$_selectedValue1\n종료교시$_selectedValue2');
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
