import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';

// 시간표에 추가할 과목의 구역을 만들어주기 위해 반환값이 Positioned인 myLecture 함수 선언, 매개변수로 context와 Detail 클래스의 객체 lecture를 받음.
Positioned myLecture(BuildContext context, Detail lecture){
  String? _subjects = lecture.subjects; // lecture 객체의 과목명을 넘겨 받기 위한 _subjects 변수
  String? _professor = lecture.professor; // lecture 객체의 교수명을 넘겨 받기 위한 _professor 변수
  double _class = 30 + (50 * (lecture.start-1)); // lecture 객체의 시작 교시를 넘겨 받기 위한 _class 변수, 이 변수의 값에 따라 시작 위치를 선정
  double? _hour = 50 * (lecture.end! - lecture.start + 1); // lecture 객체의 시작 교시와 마지막 교시를 받아 총 수업 시간을 구하는 _hour 변수, 이 변수의 값에 따라 수업의 높이 결정
  String? _place = lecture.place; // lecture 객체의 장소를 받기 위한 _place 변수
  Color? _color = lecture.color; // lecture 객체의 색상을 받기 위한 _color 변수
  double? _infoDays = 1; // 수업의 위치를 변경해주기 위해 lecture 객체의 요일을 숫자로 받는 변수

  // if문을 통해 lecture 객체의 요일에 따라 _infoDays 변수에 값을 넣어줘 수업의 위치를 지정해줌.
  if (lecture.days=="월요일") _infoDays=1; // 월요일일 경우, 1
  if (lecture.days=="화요일") _infoDays=2; // 화요일일 경우, 2
  if (lecture.days=="수요일") _infoDays=3; // 수요일일 경우, 3
  if (lecture.days=="목요일") _infoDays=4; // 목요일일 경우, 4
  if (lecture.days=="금요일") _infoDays=5; // 금요일일 경우, 5
  if (lecture.days=="토요일") _infoDays=6; // 토요일일 경우, 6
  if (lecture.days=="일요일") _infoDays=7; // 일요일일 경우, 7

  double? _days = 45.3 * _infoDays; // 수업의 요일 위치를 정해줄 _days 변수. _infoDays 값에 따라 위치가 바뀜.

  return  Positioned( // 수업 테이블을 Positioned로 반환 받기 위해 사용
    // 월요일 9시 기준 좌표값, top: 30, left: 45.5
    top: _class, // _class 값에 따라 수업의 시작교시 위치를 지정해줌.
    left: _days, // _days 값에 따라 수업의 요일 위치를 지정해줌.
    child: GestureDetector( // 수업 테이블을 클릭할 수 있도록 하기 위한 GestureDetector 위젯
      onTap: () async { // 비동기 방식을 사용하기 위한 async, await 키워드
        await showDialog( //  클릭한 수업의 정보를 showDialog 함수를 통해 보여줌.
            context: context,
            builder: (context){
              return LectureDialog(lecture: lecture);
            }
          );
      },
      child: Container( // 수업 1교시마다의 구역
        //한 칸 기준, h: 50, width: 45
        color: _color, // _color 값에 따라 수업의 색상을 지정해줌.
        height: _hour, // _hour 값에 따라 수업의 시간(높이)를 지정해줌.
        width: 45, // 수업의 너비는 45로 고정
        child: Text(_subjects+"\n"+_professor+"\n"+_place), // 추가된 수업 테이블에 과목명, 교수명, 장소를 출력하기 위한 Text 위젯
      ),
    ),
  );
}