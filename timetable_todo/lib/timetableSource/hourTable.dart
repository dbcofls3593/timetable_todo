import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Widget hourTable() {
  return Expanded(
    child: Table(
      children: [
        TableRow(
            children: [
              Container(
                  height: 30.0,
                  ),
            ]),
        for (int i = 1; i < 11; i++)
          TableRow(children: [
            Container( // 색 박스 칸 나눔
              child: Text("$i교시"),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: 1,
                      color:Colors.grey.shade300),
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