import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget myTable(String week, Color col,
    {int startnum = 0, int endnum = 0, String subject = ""}) {
  return Expanded(
    child: Table(
      border: TableBorder( // 월~일 구역 나누는 선
          left: BorderSide(
              color: Colors.grey.shade300)
      ),
      children: [
        TableRow(
            children: [
              Container(
                  height: 30.0,
                  child: Center(
                      child: Text(
                        week,
                      ))),
            ]),
        for (int i = 0; i < 10; i++)
          TableRow(children: [
            i >= startnum && i < endnum?
            GestureDetector(
              onTap: (){
                print("timetable click");
              },
              // behavior: HitTestBehavior.opaque,
              child: Container( // 색 박스 칸 나눔
                child: i==startnum ? Text(subject.toString(), style: TextStyle(fontSize: 11)):null,
                decoration: BoxDecoration(
                  color:col,
                  border: Border(
                    top: BorderSide(
                        width: 1,
                        color:Colors.red),
                    bottom: BorderSide(width: 0, color: Colors.transparent),
                  ),
                ),
                height: 50.0,
              ),
            ):
            Container(
              decoration: BoxDecoration(
                color:Colors.transparent,
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color:  Colors.grey.shade300),
                  bottom: BorderSide(width: 0, color: Colors.transparent),
                ),
              ),
              height: 50.0,
            )
            ,
          ]
          ),
      ],
    ),
  );
}