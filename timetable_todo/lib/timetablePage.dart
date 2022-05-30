import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './timetableSource/hourTable.dart';
import './timetableSource/myTable.dart';
import './timetableSource/myLecture.dart';
import 'package:timetable_todo/Dialog/lectureCreateDialog.dart';
import './Dialog/lectureCreateDialog.dart';

class timetablePage extends StatefulWidget {
  const timetablePage({Key? key}) : super(key: key);

  @override
  State<timetablePage> createState() => _timetablePageState();
}

class _timetablePageState extends State<timetablePage> {

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
                            myLecture(
                                context,
                                "UI/UX 프로그래밍",
                                "안용학",
                                "1",
                                5,
                                7,
                                "아) 2공 509호",
                                0xffb74093), //myLecture()
                            myLecture(
                                context,
                                "hello",
                                "하이",
                                "3",
                                1,
                                3,
                                "아산",
                                0xffb74093),
                            myLecture(
                                context,
                                "hello",
                                "하이",
                                "5",
                                4,
                                6,
                                "아산",
                                0xffb74093),
                            myLecture(
                                context,
                                "test",
                                "정민성",
                                "1",
                                1,
                                3,
                                "오산",
                                0xffb74093),
                            myLecture(
                                context,
                                "test",
                                "정민성",
                                "1",
                                1,
                                3,
                                "오산",
                                0xffb22293),

                          ],
                        ),
                      ),
                    ]
                ),
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => CreateDialog()
          );
        },
        child: const Icon(Icons.add,color: Colors.black,size: 30,),
        shape: RoundedRectangleBorder(side: BorderSide(width: 3,color: Colors.black12),borderRadius: BorderRadius.circular(100)),
        ),
    );
  }
}
