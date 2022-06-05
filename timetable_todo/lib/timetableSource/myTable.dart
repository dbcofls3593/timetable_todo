import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget myTable(String week) {
  return Expanded(
    child: Table(
      border: TableBorder(
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
            GestureDetector(
              onTap: (){
                print("timetable click");
              },
              child: Container( // 색 박스 칸 나눔
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 1,
                        color: Colors.grey.shade300),
                    bottom: BorderSide(width: 0, color: Colors.transparent),
                  ),
                ),
                height: 50.0,
              ),
            ),
          ]
          ),
      ],
    ),
  );
}