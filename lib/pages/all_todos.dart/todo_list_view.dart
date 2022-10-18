import 'package:fluter_todo_app/models/todo.dart';
import 'package:fluter_todo_app/pages/all_todos.dart/todo_item.dart';
import 'package:flutter/material.dart';

class ToDoListView extends StatelessWidget {
  const ToDoListView({super.key, required this.todos});
  final List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          ToDoItem(
            todo: todos[index],
            index: index,
          )
        ],
      ),
      itemCount: todos.length,
    );
  }
}
