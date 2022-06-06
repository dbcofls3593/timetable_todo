import 'package:flutter/material.dart';
import 'package:timetable_todo/todoItem.dart';

class Detail{
  Color? color; // 수업의 색상을 받기 위한 color 변수
  String subjects=''; // 과목명을 받기 위한 subjects 변수
  String professor=''; // 교수명을 받기 위한 professor 변수
  String days=''; // 요일을 받기 위한 days 변수
  int start=1; // 시작 교시를 받기 위한 start 변수
  int? end; // 마지막 교시를 받기 위한 end 변수
  String place=''; // 장소를 받기 위한 place 변수
  List<Todo> lectureTodos = <Todo>[]; // 과목의 Todo list를 받기 위한 lectureTodos 리스트

  // 객체 값을 전달 받기 위한 Detail 클래스의 생성자, 매개변수로 색상, 과목명, 교수명, 요일, 시작 교시, 마지막 교시, 장소를 받음
  Detail(Color color, String subjects, String professor, String days, int start, int end, String place){
    this.color = color;
    this.subjects = subjects;
    this.professor = professor;
    this.days = days;
    this.start = start;
    this.end = end;
    this.place = place;
    //this.todotext = todotext;
  }
  // 객체가 제대로 전달됐는지 확인하기 위한 printdetail() 함수
  void printdetail(){
    print('Object delivery successful\n');
    print("Object is ${this.color}, ${this.subjects}, ${this.professor}, ${this.days}, ${this.start}, ${this.end}"
        ", ${this.place}");
  }

}