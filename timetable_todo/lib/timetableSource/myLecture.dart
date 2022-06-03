import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';

// 무슨 요일, 몇 시, 몇 시간
// days의 값에 따라 x값 변화
// hour와 min의 값에 다라 y값이 변화
Positioned myLecture(BuildContext context, String subjects, String professor, String days, int startclass,int endclass, String place, int color){
  String _subjects = subjects; // 수업명
  String _professor = professor; // 교수명
  double _class = 30 + (50 * (startclass-1)); // 시작 교시 1교시:1, 2교시:2, ... , 10교시: 10 -> 스택의 시작 위치 선정을 위한 변수
  double _hour = 50 * (endclass - startclass + 1); // 강의시간 ->
  String _place = place; // 장소
  int _color = color; // 색상

  if (days=="월요일") days="1";
  if (days=="화요일") days="2";
  if (days=="수요일") days="3";
  if (days=="목요일") days="4";
  if (days=="금요일") days="5";
  if (days=="토요일") days="6";
  if (days=="일요일") days="7";

  double _days = 45.3 * int.parse(days); // 요일 월:1, 화:2, ... , 일:7

  return  Positioned(
    // 월요일 9시 기준 좌표값, top: 30, left: 45.5
    top: _class,
    left: _days,
    child: GestureDetector(
      onTap: () async { // mark the function as async
        // await the dialog
        await showDialog(
            context: context,
            builder: (context){
              return lectureDialog(context);
            }
              );
        // Doesn't run
        //Navigator.pop(context);
      },
      child: Container(
        //한 칸 기준, h: 50, width: 45
        color: Color(_color),
        height: _hour,
        width: 45,
        child: Text(_subjects+"\n\n"+_professor+"\n\n"+_place),
      ),
    ),
  );
}