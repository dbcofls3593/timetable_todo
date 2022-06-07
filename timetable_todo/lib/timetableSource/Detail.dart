import 'package:flutter/material.dart';
import 'package:timetable_todo/todoItem.dart';

class Detail {
  Color? color; // 수업의 색상
  String subjects = ''; // 과목명
  String professor = ''; // 교수명
  String days = ''; // 요일
  int start = 1; // 시작 교시
  int? end; // 마지막 교시
  String place = ''; // 장소
  List<Todo> lectureTodos = <Todo>[]; // 과목의 Todo list를 받기 위한 lectureTodos 리스트

  // 객체 값을 전달 받기 위한 Detail 클래스의 생성자, 매개변수로 색상, 과목명, 교수명, 요일, 시작 교시, 마지막 교시, 장소를 받음
  Detail(this.color, this.subjects, this.professor, this.days, this.start,
      this.end, this.place, this.lectureTodos);

  // 객체가 제대로 전달됐는지 확인하기 위한 printdetail() 함수
  void printdetail() {
    print('Object delivery successful\n');
    print("Object is ${this.color}, ${this.subjects}, ${this.professor}, ${this.days}, ${this.start}, ${this.end}"
        ", ${this.place}");
  }
}
