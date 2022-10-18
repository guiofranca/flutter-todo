import 'package:fluter_todo_app/pages/all_todos.dart/todo_list_view.dart';
import 'package:fluter_todo_app/shared/todo_hive_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CompletedToDosPage extends StatelessWidget {
  const CompletedToDosPage({super.key});

  String _title(int count) {
    return "$count Completed Task${count == 1 ? '' : 's'}";
  }

  @override
  Widget build(BuildContext context) {
    var repo = ToDoHiveBox.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ValueListenableBuilder(
            valueListenable: repo.box.listenable(),
            builder: ((context, box, _) => Text(_title(repo.completed.length))),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: repo.box.listenable(),
        builder: (context, box, _) => ToDoListView(todos: repo.completed),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).pushNamed('add_todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
