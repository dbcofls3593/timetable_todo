import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import 'package:timetable_todo/main.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';
import './timetableSource/hourTable.dart';
import './timetableSource/myTable.dart';
import './timetableSource/myLecture.dart';

final TextEditingController subjectsController = TextEditingController();
final TextEditingController professorController = TextEditingController();
final TextEditingController placeController = TextEditingController();
int selectedValue1 = 1;
int selectedValue2 = 1;
String selectedDateValue = '월요일';
Color colorName = Color(0xffFD9D9D);

class timetablePage extends StatefulWidget {
  const timetablePage({Key? key}) : super(key: key);

  @override
  State<timetablePage> createState() => _timetablePageState(); // 위젯의 생명주기
}

class _timetablePageState extends State<timetablePage> with AutomaticKeepAliveClientMixin<timetablePage>{
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Scaffold( // 앱의 뼈대가 되는 Scaffold 위젯
      appBar: PreferredSize( // 앱바를 자식의 레이아웃에 어떠한 영향도 끼치지 않으면서 부모에 의해 사용될 기본 크기를 가지기 위해 PreferredSize 위젯 사용
        preferredSize: const Size.fromHeight(70.0), // 앱바의 높이를 70으로 지정
        child: AppBar(
          automaticallyImplyLeading: false, // 이전 화면으로 돌아가는 버튼을 false
          flexibleSpace: Container(), // flexibleSpace에 Container를 추가
          title: Padding( // 앱바의 Padding
            padding: const EdgeInsets.only(left: 10.0), // left를 기준으로 10만큼 padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 앱바를 중심선에 정렬하기 위해 사용
              crossAxisAlignment: CrossAxisAlignment.start, // 앱바를 세로축을 기준으로 왼쪽 정렬하기 위해 사용
              children: [ // 여러 위젯을 사용하기 위한 children
                Container(height: 10), // 앱바의 높이를 10으로 지정
                const Text('시간표', // 앱바에 시간표를 출력하며, 텍스트의 색상을 검정, bold체, 크기를 23으로 지정
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white, // 앱바의 backgroundColor를 흰색으로 지정
          elevation: 0.3, // 앱바의 그림자 효과를 0.3 크기로 지정
        ),
      ),
      backgroundColor: Colors.white, // 앱의 backgroundColor 흰색으로 지정
      body: SafeArea( // 앱의 UI를 기기별로 깔끔하게 보여지기 위해 SafeArea 위젯을 사용
          child: SingleChildScrollView( // 화면이 짤리는 것을 방지하기 위하여 스크롤을 가능하게 해주기 위하여 사용
              scrollDirection: Axis.vertical, // scrollDirection을 주축을 기준으로 수직으로 나열하기 위하여 사용
              child: Center( // 자식에서 사용될 열을 중앙배치하기 위하여 사용
                child: Column( // timetable을 열로 배치
                    mainAxisAlignment: MainAxisAlignment.center, // timetable을 세로축을 기준으로 가운데 정렬하기 위하여 사용
                    crossAxisAlignment: CrossAxisAlignment.center, // timetable을 세로축을 기준으로 가운데 정렬하기 위하여 사용
                    children: [ // 여러 위젯을 사용하기 위한 children
                      Container( // timetable 박스를 Container 위젯으로 만들어주고, 너비를 400, 왼쪽 15, 위 30, 오른쪽 15, 밑 5로 margin, Container의 색상을 gray.shade300, Container 가장자리에 크기 10만큼 원을 그려줌
                        width: 400,
                        margin: EdgeInsets.fromLTRB(15, 30, 15, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Stack( // Stack 위젯을 이용하여 수업을 넣어줘서 위치를 지정해줌.
                          children: [ // 여러 위젯을 사용하기 위한 children
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center, // timetable을 세로축을 기준으로 가운데 정렬하기 위하여 사용
                              mainAxisAlignment: MainAxisAlignment.center, // timetalbe을 세로축을 기준으로 가운데 정렬하기 위하여 사용
                              children: [ // 여러개의 위젯을 사용하기 위하여 children 사용
                                hourTable(), // hourTable 위젯 함수를 호출하여 교시 열을 만들어줌.
                                myTable("월"), // myTable 위젯 함수를 호출하여 월요일 열을 만들어줌.
                                myTable("화"), // myTable 위젯 함수를 호출하여 화요일 열을 만들어줌.
                                myTable("수"), // myTable 위젯 함수를 호출하여 수요일 열을 만들어줌.
                                myTable("목"), // myTable 위젯 함수를 호출하여 목요일 열을 만들어줌.
                                myTable("금"), // myTable 위젯 함수를 호출하여 금요일 열을 만들어줌.
                                myTable("토"), // myTable 위젯 함수를 호출하여 토요일 열을 만들어줌.
                                myTable("일"), // myTable 위젯 함수를 호출하여 일요일 열을 만들어줌.
                              ],
                            ),

                            for(int i=1;i<lectures.length;i++) // 수업을 여러개 만들기 위하여 반복문을 이용하여 lectures의 길이만큼 myLecture 함수 호출
                              myLecture(context, lectures[i])

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
              builder: (BuildContext context) =>  CreateDialog(lectures: lectures, subjectsController: subjectsController, professorController: professorController, placeController: placeController, selectedDateValue: selectedDateValue, selectedValue1: selectedValue1, selectedValue2: selectedValue2, newColorname: colorName)
          );
        },
        child: const Icon(Icons.add,color: Colors.black,size: 30,),
        shape: RoundedRectangleBorder(side: BorderSide(width: 3,color: Colors.black12),borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
  // LectureAddDialog(){
  //   return AlertDialog(
  //       insetPadding: EdgeInsets.all(20),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
  //       title: Text('수업 추가', style: TextStyle(fontWeight : FontWeight.bold)),
  //       content:
  //       Container(
  //         width: 500,
  //         padding: EdgeInsets.only(left: 20, right: 20),
  //         child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextField(
  //                   decoration: InputDecoration(labelText: '수업명'),
  //                   style: TextStyle(fontWeight : FontWeight.bold),
  //                   keyboardType: TextInputType.text,
  //                   controller: subjectsController,
  //                 ),
  //                 TextField(
  //                   decoration: InputDecoration(labelText: '교수명'),
  //                   style: TextStyle(fontWeight : FontWeight.bold),
  //                   keyboardType: TextInputType.text,
  //                   controller: professorController,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 12.0),
  //                   child: Row(
  //                     children: [
  //                       Text("시간", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
  //                     ],
  //                   ),
  //                 ),
  //                 Row(
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 12.0),
  //                       child: Container(
  //                           child: DropdownButton<String>(
  //                             value: _selectedDateValue,
  //                             items: _dateList.map((days){
  //                               return DropdownMenuItem(
  //                                 value: days,
  //                                 child: Text(days),
  //                               );
  //                             }).toList(),
  //                             onChanged: (dynamic days){
  //                               setState((){
  //                                 _selectedDateValue = days;
  //                               });
  //                             },
  //                           )
  //                       ),
  //                     ),
  //                     Container(
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(right: 2.0),
  //                           child: DropdownButton<int>(
  //                             value: _selectedValue1,
  //                             items: _startList.map((startclass){
  //                               return DropdownMenuItem(
  //                                 value: startclass,
  //                                 child: Text('$startclass교시'),
  //                               );
  //                             }).toList(),
  //                             onChanged: (dynamic startclass){
  //                               setState((){
  //                                 _selectedValue1 = startclass;
  //                               });
  //                             },
  //                           ),
  //                         )
  //                     ),
  //                     Text(" 부터 "),
  //                     Container(
  //                         child: Padding(
  //                           padding: const EdgeInsets.only(left: 2.0),
  //                           child: DropdownButton<int>(
  //                             value: _selectedValue2,
  //                             items: _endList.map((endclass){
  //                               return DropdownMenuItem(
  //                                 value: endclass,
  //                                 child: Text('$endclass교시'),
  //                               );
  //                             }).toList(),
  //                             onChanged: (dynamic endclass){
  //                               setState((){
  //                                 _selectedValue2 = endclass;
  //                               });
  //                             },
  //                           ),
  //                         )
  //                     ),
  //
  //                   ],
  //                 ),
  //                 TextField(
  //                   decoration: InputDecoration(labelText: '장소'),
  //                   style: TextStyle(fontWeight : FontWeight.bold),
  //                   keyboardType: TextInputType.text,
  //                   controller: placeController,
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 12.0),
  //                   child: Row(
  //                     children:[
  //                       Text('색상', style: TextStyle(fontWeight : FontWeight.bold, color: Colors.black54)),
  //                     ],
  //                   ),
  //                 ),
  //                 Center(
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Radio(
  //                               value: 1,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffFD9D9D)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffFD9D9D);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 2,
  //                               //groupValue: _colorSelect,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffD5EFD0)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   //_colorSelect = 2;
  //                                   colorname = Color(0xffD5EFD0);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 3,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffA2DBD1)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffA2DBD1);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 4,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffEBB889)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffEBB889);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 5,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xff92AE9F)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xff92AE9F);
  //                                 });
  //                               }),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         children: [
  //                           Radio(
  //                               value: 7,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffB1CEFB)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffB1CEFB);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 8,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffDAB1FB)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffDAB1FB);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 9,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffB1E9FB)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffB1E9FB);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 10,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xffffcc00)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xffffcc00);
  //                                 });
  //                               }),
  //                           Radio(
  //                               value: 11,
  //                               groupValue: colorname,
  //                               fillColor : MaterialStateColor.resolveWith((states) => Color(0xff7fc638)),
  //                               onChanged: (val){
  //                                 setState((){
  //                                   colorname = Color(0xff7fc638);
  //                                 });
  //                               }),
  //                         ],
  //                       )
  //
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             )
  //         ),
  //       ),
  //
  //       actions: <Widget>[
  //         TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               return setState(() {
  //                 lectures.add(Detail(colorname, subjectsController.text, professorController.text, _selectedDateValue, _selectedValue1, _selectedValue2, placeController.text));
  //
  //                 subjectsController.clear();
  //                 professorController.clear();
  //                 //_selectedDateValue.clear();
  //                 //_selectedValue1.clear();
  //                 //_selectedValue2.clear();
  //                 placeController.clear();
  //
  //               });
  //             },
  //             child: Text('확인', style: TextStyle(color: Colors.indigo, fontWeight : FontWeight.bold))
  //         )
  //       ]
  //   );
  // }
}