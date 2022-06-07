import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// timetable에서 요일의 구역을 나누어주기 위한 myTable 위젯 함수 선언, 매개변수로 week(요일)을 받음.
Widget myTable(String week) {
  return Expanded(
    child: Table(
      border: TableBorder(left: BorderSide(color: Colors.grey.shade300)),
      children: [
        TableRow(children: [
          Container(height: 30.0, child: Center(child: Text(week))),
        ]),
        for (int i = 0; i < 10; i++) // 1교시~10교시의 행을 만들어주기 위한 반복문
          TableRow(children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade300),
                  bottom: BorderSide(width: 0, color: Colors.transparent),
                ),
              ),
              height: 50.0,
            ),
          ]),
      ],
    ),
  );
}
