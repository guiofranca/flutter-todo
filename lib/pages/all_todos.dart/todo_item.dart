import 'package:fluter_todo_app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo, required this.index});
  final ToDo todo;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        leading: Icon(todo.done ? Icons.done : Icons.hourglass_bottom),
        title: Text(todo.text),
        trailing: Checkbox(
          onChanged: (bool? value) {
            todo.done = value ?? false;
            todo.save();
          },
          value: todo.done,
        ),
        onTap: () {
          GoRouter.of(context)
              .pushNamed('edit_todo', params: {'id': index.toString()});
        },
        onLongPress: () => todo.delete(),
      ),
    );
  }
}
