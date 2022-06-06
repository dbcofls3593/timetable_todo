import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// timetable의 교시 열을 보여주기 위한 hourTable 위젯 함수
Widget hourTable() {
  return Expanded( // 교시 열이 핸드폰 화면에 맞게 균일하게 배치하기 위해 Expanded를 return 받음.
    child: Table( // Scrool이 불가능한 GridView 위젯을 사용하기 위해 Table 위젯을 사용.
      children: [ // 여러 개의 위젯을 사용하기 위해 children 사용
        TableRow( // 교시 열에서 빈칸 테이블
            children: [
              Container( // 빈칸의 높이를 30으로 지정
                  height: 30.0,
                  ),
            ]),
        // 교시 열에서 1교시, 2교시, ... , 9교시, 10교시의 숫자를 넣어주기 위하여 i 변수를 선언하고, 반복문 사용
        for (int i = 1; i < 11; i++) // 1교시부터 10교시까지의 10개의 행을 만들어주기 위한 반복문
          TableRow(children: [
            Container(
              child: Center( // 교시 열에서 N교시를 보기 좋게 만들어주기 위해 Center 사용
              child: Text("$i교시"),), // 교시 열에서 1교시~10교시 보여주기 위한 Text
              decoration: BoxDecoration( // Container 위젯을 사용하여 생성된 구역을 꾸며주기 위해 BoxDecoration 위젯 사용
                border: Border( // 시간표의 선을 나누어주기 위해 사용한 Border 위젯
                  top: BorderSide( // 1교시 2교시와 같이 사이의 구분선을 나타내주기 위해 사용, 너비로는 1, 컬러는 grey.shade300
                      width: 1,
                      color:Colors.grey.shade300),
                ),
              ),
              height: 50.0, // 교시 열에서 N교시 칸 마다의 높이를 50으로 지정
            ),
          ]
          ),
      ],
    ),
  );
}