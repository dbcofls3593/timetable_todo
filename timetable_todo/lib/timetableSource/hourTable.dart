import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget hourTable(String week, Color col, {int startnum = 0, int endnum = 0, String subject = ""}) {
  return Expanded(
    child: Table(
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
        for (int i = 1; i < 11; i++)
          TableRow(children: [
            Container( // 색 박스 칸 나눔
              child: Text("$i교시"),
              decoration: BoxDecoration(
                color:col,
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color:Colors.grey.shade300),
                  bottom: BorderSide(width: 10, color: Colors.transparent),
                ),
              ),
              height: 50.0,
            ),
          ]
          ),
      ],
    ),
  );
}