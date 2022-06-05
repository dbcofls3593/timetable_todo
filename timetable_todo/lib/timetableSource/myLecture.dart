import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';

// 무슨 요일, 몇 시, 몇 시간
// days의 값에 따라 x값 변화
// hour와 min의 값에 다라 y값이 변화
Positioned myLecture(BuildContext context, Detail lecture){
  String? _subjects = lecture.subjects; // 수업명
  String? _professor = lecture.professor; // 교수명
  double _class = 30 + (50 * (lecture.start-1)); // 시작 교시 1교시:1, 2교시:2, ... , 10교시: 10 -> 스택의 시작 위치 선정을 위한 변수
  double? _hour = 50 * (lecture.end! - lecture.start + 1); // 강의시간 ->
  String? _place = lecture.place; // 장소
  Color? _color = lecture.color; // 색상

  double? _infoDays = 1;

  if (lecture.days=="월요일") _infoDays=1;
  if (lecture.days=="화요일") _infoDays=2;
  if (lecture.days=="수요일") _infoDays=3;
  if (lecture.days=="목요일") _infoDays=4;
  if (lecture.days=="금요일") _infoDays=5;
  if (lecture.days=="토요일") _infoDays=6;
  if (lecture.days=="일요일") _infoDays=7;

  double? _days = 45.3 * _infoDays; // 요일 월:1, 화:2, ... , 일:7

  return  Positioned(
    // 월요일 9시 기준 좌표값, top: 30, left: 45.5
    top: _class,
    left: _days,
    child: GestureDetector(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context){
              return lectureDialog(context,lecture);
            }
          );
      },
      child: Container(
        //한 칸 기준, h: 50, width: 45
        color: _color,
        height: _hour,
        width: 45,
        child: Text(_subjects+"\n"+_professor+"\n"+_place),
      ),

    ),

  );


}