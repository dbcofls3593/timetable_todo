import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// timetable의 교시 열을 보여주기 위한 hourTable 위젯 함수
Widget hourTable() {
  return Expanded(
    child: Table(
      children: [
        TableRow(children: [
          Container(
            height: 30.0,
          ),
        ]),
        // 교시 열에서 1교시, 2교시, ... , 9교시, 10교시의 숫자를 넣어주기 위하여 i 변수를 선언하고, 반복문 사용
        for (int i = 1; i < 11; i++)
          TableRow(children: [
            Container(
              child: Center(
                child: Text("$i교시"),
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade300),
                ),
              ),
              height: 50.0,
            ),
          ]),
      ],
    ),
  );
}
