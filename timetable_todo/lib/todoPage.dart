import 'package:flutter/material.dart';

class Todo {
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return TextStyle(
      fontSize: 17,
    );

    return TextStyle(
      fontSize: 17,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          onTap: () {
            onTodoChanged(todo);
          },
          leading: todo.checked?Icon(
              Icons.check_circle_outline
          ):Icon(Icons.radio_button_unchecked,color: Colors.grey,),
          title: Text(todo.name, style: _getTextStyle(todo.checked)),
          contentPadding: EdgeInsets.zero,
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => new _TodoListState();
}



class _TodoListState extends State<TodoList> with AutomaticKeepAliveClientMixin<TodoList>{

  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

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
                  children: _todos.map((Todo todo) {
                    return TodoItem(
                      todo: todo,
                      onTodoChanged: _handleTodoChange,
                    );
                  }).toList(),
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
      _todos.add(Todo(name: name, checked: false));
    });
    _textFieldController.clear();
  }

  void _removeTodoItem() {
    setState(() {
      _todos.clear();
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

