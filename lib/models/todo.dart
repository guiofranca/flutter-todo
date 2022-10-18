import 'package:hive_flutter/hive_flutter.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  String text;

  @HiveField(1)
  bool done;

  ToDo({required this.text, required this.done});

  String? validateText(String? value) {
    if (value == null) return "Task name is required";
    if (value.isEmpty) return "Task name is required";
    if (value.length < 3) return "Task length should be greater than 3";
    return null;
  }
}
