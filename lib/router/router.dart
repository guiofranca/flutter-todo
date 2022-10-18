import 'package:fluter_todo_app/models/todo.dart';
import 'package:fluter_todo_app/pages/all_todos.dart/edit_todo.dart';
import 'package:fluter_todo_app/pages/all_todos.dart/todos_page.dart';
import 'package:fluter_todo_app/shared/todo_hive_box.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ToDoHiveBox(
        box: Hive.box<ToDo>('todos'),
        child: const ToDosPage(),
      ),
    ),
    GoRoute(
      path: '/todo/create',
      name: 'add_todo',
      builder: (context, state) => ToDoHiveBox(
        box: Hive.box<ToDo>('todos'),
        child: const EditToDo(),
      ),
    ),
    GoRoute(
      path: '/todo/:id',
      name: 'edit_todo',
      builder: (context, state) => ToDoHiveBox(
        box: Hive.box<ToDo>('todos'),
        child: EditToDo(id: int.parse(state.params['id'] ?? '')),
      ),
    )
  ],
);
