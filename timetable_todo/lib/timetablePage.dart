import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import 'package:timetable_todo/main.dart';
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
                        child: Stack( // Stack 위젯을 이용하여 수업을 넣어줘서 위치를 지정해줌.
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                hourTable(), // 교시 열 생성 위젯 함수
                                myTable("월"), // 요일 열 생성 위젯 함수
                                myTable("화"),
                                myTable("수"),
                                myTable("목"),
                                myTable("금"),
                                myTable("토"),
                                myTable("일"),
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
        onPressed: () { // 버튼 클릭시, 수업 생성 다이얼로그가 나타남.
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
}