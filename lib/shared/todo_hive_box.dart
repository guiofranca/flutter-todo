import 'package:fluter_todo_app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoHiveBox extends InheritedWidget {
  const ToDoHiveBox({
    super.key,
    required this.box,
    required super.child,
  });

  final Box<ToDo> box;

  List<ToDo> get all => box.values.toList();

  List<ToDo> get completed =>
      box.values.where((element) => element.done).toList();

  List<ToDo> get unCompleted =>
      box.values.where((element) => !element.done).toList();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static ToDoHiveBox of(BuildContext context) {
    final ToDoHiveBox? result =
        context.dependOnInheritedWidgetOfExactType<ToDoHiveBox>();
    assert(result != null, 'No ToDoHiveBox found in context');
    return result!;
  }
}
