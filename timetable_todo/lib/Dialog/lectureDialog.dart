import 'package:flutter/material.dart';
import 'package:timetable_todo/main.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';
import '../todoItem.dart';
import 'lectureUpdateDialog.dart';

class LectureDialog extends StatefulWidget {
  Detail lecture;
  LectureDialog({Key? key,required this.lecture}) : super(key: key);

  // _LectureDialogState 생명주기
  @override
  State<LectureDialog> createState() => _LectureDialogState();
}

Color colorName = Color(0xffFD9D9D);

class _LectureDialogState extends State<LectureDialog> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog( // 수업 정보를 보여주는 다이얼로그
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container( // 수업 다이얼로그에서 수업의 색상을 보여줌.
                  decoration: BoxDecoration(
                      color: widget.lecture.color
                  ),
                  height: 29,
                  width: 7,
                ),
                Padding( // 수업 다이얼로그에서 수업명을 보여줌.
                    padding: const EdgeInsets.only(left: 7),
                    child: Text(
                        widget.lecture.subjects,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20)
                    )
                ),
              ],
            ),

            Row(
              children: [
                IconButton(
                    icon: const Icon( // 수업 다이얼로그에서 수정 아이콘
                        Icons.create, color: Colors.black45, size: 24),
                    onPressed: () { // 수정 아이콘 클릭시 UpdateDialog를 호출해줌.
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => UpdateDialog(lecture: widget.lecture, subjectsController: subjectsController, professorController: professorController, placeController: placeController, selectedDateValue: selectedDateValue, selectedValue1: selectedValue1, selectedValue2: selectedValue2, newColorname: colorName)
                      );
                    }),

                IconButton( // 수업 다이얼로그에서 삭제 아이콘
                    icon: const Icon(
                        Icons.delete, color: Colors.black45, size: 24),
                    onPressed: () =>
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog( // 삭제 아이콘 버튼 클릭시 수업 삭제 다이얼로그를 보여줌.
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17.0)),
                                  title: const Text(
                                      '수업 삭제', // 수업 삭제 다이얼로그의 타이틀
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                  content: Container( // 수업 삭제 다이얼로그에서 수업을 삭제하겠다는 텍스트를 보여줌.
                                    width: 700,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: const[
                                        Text("수업을 삭제하시겠습니까?"),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton( // 수업 삭제 다이얼로그에서 취소 버튼
                                        onPressed: () {
                                          Navigator.of(context).pop(); // 취소 버튼 클릭시 이전 화면으로 돌아감.
                                        },
                                        child: const Text(
                                            '취소',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            )
                                        )
                                    ),
                                    TextButton(
                                        onPressed: () { // 확인 버튼 클릭시 수업이 삭제되며, 변수들이 초기화 됨.
                                          widget.lecture.subjects = "";
                                          widget.lecture.professor = "";
                                          widget.lecture.days = "";
                                          widget.lecture.start = 0;
                                          widget.lecture.end = 0;
                                          widget.lecture.place = "";
                                          widget.lecture.color = null;
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => // 확인 버튼 클릭시 timetable 화면 호출
                                                const MyHomePage()),
                                          );
                                        },
                                        child: const Text( // 수업 삭제 다이얼로그의 확인 버튼
                                            '확인',
                                            style: TextStyle(
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.bold
                                            )
                                        )
                                    ),
                                  ],
                                )
                        )
                )
              ],
            ),
          ]
      ),
      content: Container(
        width: 700,
        //height: 800,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column( // 수업 다이얼로그의 세부정보를 보여주는 열
                children: [
                  Row( // 수업 다이얼로그 정보의 교수명
                    children: [
                      Text(widget.lecture.professor, style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 13)),
                    ],
                  ),
                  Row( // 수업 다이얼로그 정보의 요일 및 시작교시와 마지막교시
                    children: [
                      Text('${widget.lecture.days}  ${widget.lecture.start}교시 - ${widget.lecture
                          .end}교시',
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 13)),
                    ],
                  ),
                  Row( // 수업 다이얼로그 정보의 장소
                    children: [
                      Text(widget.lecture.place,
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 13)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                  height: 10
              ),
              SizedBox(
                height: 300,
                child: Column( // 수업 다이얼로그에서 To-Do list를 보여주는 열
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('TO-DO',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16)),
                        IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              _displayDialog();
                            }
                            ),
                      ],
                    ),
                    Expanded(
                      child: ListView( // To-Do list를 추가하면 보여주는 리스트뷰
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        children: widget.lecture.lectureTodos.map((Todo todo) {
                          return TodoItem(
                              todo: todo,
                              onTodoChanged: _handleTodoChange,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _handleTodoChange(Todo todo) { // todo 상태 변화를 체크하는 함수
    setState(() {
      todo.checked = !todo.checked;
    });
  }
  void _addTodoItem(String name) { // todo add
    setState(() {
      widget.lecture.lectureTodos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }
  Future<void> _displayDialog() async { // todo 추가 다이얼로그
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('TODO 추가하기'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: '입력'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('추가'),
              onPressed: () { // 추가 버튼 클릭시 todo가 추가되면서 이전화면으로 돌아감
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
}