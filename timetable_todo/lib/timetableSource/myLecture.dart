import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:timetable_todo/Dialog/lectureDialog.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';

// 시간표에 추가할 과목의 구역을 만들어주기 위해 반환값이 Positioned인 myLecture 함수 선언, 매개변수로 context와 Detail 클래스의 객체 lecture를 받음.
Positioned myLecture(BuildContext context, Detail lecture) {
  String? _subjects = lecture.subjects;
  String? _professor = lecture.professor;
  double _class = 30 + (50 * (lecture.start - 1));
  double? _hour = 50 * (lecture.end! - lecture.start + 1);
  String? _place = lecture.place;
  Color? _color = lecture.color;
  double? _infoDays = 1; // 수업의 위치를 변경해주기 위해 lecture 객체의 요일을 숫자로 받는 변수

  // if문을 통해 lecture 객체의 요일에 따라 _infoDays 변수에 값을 넣어줘 수업의 위치를 지정해줌.
  if (lecture.days == "월요일") _infoDays = 1;
  if (lecture.days == "화요일") _infoDays = 2;
  if (lecture.days == "수요일") _infoDays = 3;
  if (lecture.days == "목요일") _infoDays = 4;
  if (lecture.days == "금요일") _infoDays = 5;
  if (lecture.days == "토요일") _infoDays = 6;
  if (lecture.days == "일요일") _infoDays = 7;

  double? _days =
      45.3 * _infoDays; // 수업의 요일 위치를 정해줄 _days 변수. _infoDays 값에 따라 위치가 바뀜.

  // 각 수업의 위치 선정
  return Positioned(
    top: _class,
    left: _days,
    child: GestureDetector(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return LectureDialog(lecture: lecture);
            });
      },
      child: Container(
        color: _color,
        height: _hour,
        width: 45,
        child: Text(_subjects + "\n" + _professor + "\n" + _place),
      ),
    ),
  );
}
