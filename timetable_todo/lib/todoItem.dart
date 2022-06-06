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
          leading: todo.checked? Icon(Icons.check_circle_outline)
              : Icon(Icons.radio_button_unchecked,color: Colors.grey,),
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
