import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// timetable에서 요일의 구역을 나누어주기 위한 myTable 위젯 함수 선언, 매개변수로 week(요일)을 받음.
Widget myTable(String week) {
  return Expanded( // timetable을 핸드폰 화면에 맞게 배치하기 위해 사용한 Expanded 위젯
    child: Table( // Scroll이 불가능한 GridView 위젯을 사용하기 위해 Table 위젯 사용
      border: TableBorder( // 월~일 구역을 나누는 선을 만들기 위해 TableBorder 위젯 사용
          left: BorderSide( // timetable 왼쪽 사이드 부분의 색상을 grey.shade300으로 지정
              color: Colors.grey.shade300)
      ),
      children: [ // 여러 개의 위젯을 사용하기 위해 children 사용
        TableRow( // 요일을 나누어주는 행의 높이를 30, week 변수를 통해 행에 요일을 Text 위젯으로부터 출력해줌
            children: [
              Container(
                  height: 30.0,
                  child: Center(
                      child: Text(
                        week,
                      ))),
            ]),
        for (int i = 0; i < 10; i++) // 1교시~10교시의 행을 만들어주기 위한 반복문
          TableRow( // 교시 열을 나누어주기 위해 TableRow 사용
              children: [ // 여러 위젯을 사용하기 위한 children
                Container( // 추가한 시간표의 구역을 만들어주기 위한 Container 위젯
                  decoration: BoxDecoration( // Container 위젯을 사용하여 생성된 구역을 꾸며주기 위한 BoxDecoration 위젯
                    border: Border( // 시간표의 선을 나누어주기 위한 Border 위젯
                      top: BorderSide( // top에서 timetable의 겉부분을 너비가 1이고, 색상이 grey.shade300인 선 하단은 투명색으로 지정
                        width: 1,
                        color: Colors.grey.shade300),
                      bottom: BorderSide(width: 0, color: Colors.transparent),
                  ),
                ),
                height: 50.0, // 각 교시가 들어갈 컨테이너의 높이를 50으로 지정
              ),
          ]
          ),
      ],
    ),
  );
}