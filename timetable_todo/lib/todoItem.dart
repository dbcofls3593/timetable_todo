import 'package:flutter/material.dart';

class Todo { //todo의 정보를 담기위한 class
  Todo({required this.name, required this.checked});
  final String name;
  bool checked;
}

class TodoItem extends StatelessWidget { //todo의 상태를 담기위한 class
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;

  TextStyle? _getTextStyle(bool checked) { //text가 체크되면 글씨의 색상과 선을 return 해줌.
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
    return Column( //todo에서 check 부분을 관리
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
