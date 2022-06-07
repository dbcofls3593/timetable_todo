import 'package:flutter/material.dart';
import 'package:timetable_todo/main.dart';
import 'package:timetable_todo/timetablePage.dart';
import 'package:timetable_todo/timetableSource/Detail.dart';
import '../todoItem.dart';
import 'lectureUpdateDialog.dart';

class LectureDialog extends StatefulWidget {
  Detail lecture;
  LectureDialog({Key? key,required this.lecture}) : super(key: key);

  @override
  State<LectureDialog> createState() => _LectureDialogState();
}

Color colorName = Color(0xffFD9D9D);

class _LectureDialogState extends State<LectureDialog> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: widget.lecture.color
                  ),
                  height: 29,
                  width: 7,
                ),
                Padding(
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
                    icon: const Icon(
                        Icons.create, color: Colors.black45, size: 24),
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => UpdateDialog(lecture: widget.lecture, subjectsController: subjectsController, professorController: professorController, placeController: placeController, selectedDateValue: selectedDateValue, selectedValue1: selectedValue1, selectedValue2: selectedValue2, newColorname: colorName)
                      );
                    }),

                IconButton(
                    icon: const Icon(
                        Icons.delete, color: Colors.black45, size: 24),
                    onPressed: () =>
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17.0)),
                                  title: const Text(
                                      '수업 삭제',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      )
                                  ),
                                  content: Container(
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
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
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
                                        onPressed: () {
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
                                                builder: (context) =>
                                                const MyHomePage()),
                                          );
                                        },
                                        child: const Text(
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
              Column(
                children: [
                  Row(
                    children: [
                      Text(widget.lecture.professor, style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 13)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${widget.lecture.days}  ${widget.lecture.start}교시 - ${widget.lecture
                          .end}교시',
                          style: const TextStyle(
                              color: Colors.black45, fontSize: 13)),
                    ],
                  ),
                  Row(
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
                child: Column(
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
                      child: ListView(
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
  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }
  void _addTodoItem(String name) {
    setState(() {
      widget.lecture.lectureTodos.add(Todo(name: name, checked: false));
      lectures[0].lectureTodos.add(widget.lecture.lectureTodos[-1]);
    });
    _textFieldController.clear();
  }
  Future<void> _displayDialog() async {
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
              onPressed: () {
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