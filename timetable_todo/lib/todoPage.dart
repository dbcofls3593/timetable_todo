import 'package:flutter/material.dart';
import 'package:timetable_todo/main.dart';
import './todoItem.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}
List<Todo> _todos = <Todo>[];
class _TodoListState extends State<TodoList> with AutomaticKeepAliveClientMixin<TodoList>{

  final TextEditingController _textFieldController = TextEditingController();


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10),
                Text('Todo List',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.3,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left:MediaQuery.of(context).size.width*0.08,
            right: MediaQuery.of(context).size.width*0.08,
            top:MediaQuery.of(context).size.width*0.05,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child:
                      Text(
                        'Todo List',
                        style: TextStyle(fontSize: 16),
                      )
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () => _displayDialog(),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _removeDialog(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  children:
                  lectures[0].lectureTodos.map((Todo todo) {
                    return TodoItem(
                      todo: todo,
                      onTodoChanged: _handleTodoChange,
                    );
                  }).toList()
                ),
              ),
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
      lectures[0].lectureTodos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  void _removeTodoItem() {
    setState(() {
      lectures[0].lectureTodos.clear();
    });
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

  Future<void> _removeDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('TODO 전체 삭제하기'),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
                _removeTodoItem();
              },
            ),
            TextButton(
              child: const Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },

    );
  }

}

