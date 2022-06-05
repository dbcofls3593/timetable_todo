import 'package:flutter/material.dart';

class Detail{
  Color? color;
  String subjects='';
  String professor='';
  String days='';
  int start=1;
  int? end;
  String place='';
  //String? todotext;


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

  void printdetail(){
    print('Object delivery successful\n');
    print("Object is ${this.color}, ${this.subjects}, ${this.professor}, ${this.days}, ${this.start}, ${this.end}"
        ", ${this.place}");
  }

}