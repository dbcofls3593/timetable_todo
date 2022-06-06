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
  State<timetablePage> createState() => _timetablePageState();
}

class _timetablePageState extends State<timetablePage> with AutomaticKeepAliveClientMixin<timetablePage>{
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
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
                const Text('시간표',
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
                                hourTable(),
                                myTable("월"),
                                myTable("화"),
                                myTable("수"),
                                myTable("목"),
                                myTable("금"),
                                myTable("토"),
                                myTable("일"),
                              ],
                            ),
                            // 강의명, 교수명, 요일, 시작교시, 마지막교시, 장소, 색상

                            for(int i=0;i<lectures.length;i++)
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