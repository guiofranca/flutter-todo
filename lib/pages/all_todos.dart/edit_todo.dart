import 'package:fluter_todo_app/models/todo.dart';
import 'package:fluter_todo_app/shared/todo_hive_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditToDo extends StatefulWidget {
  const EditToDo({super.key, this.id});
  final int? id;

  @override
  State<EditToDo> createState() => _EditToDoState();
}

class _EditToDoState extends State<EditToDo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ToDo todo;
  late String title;
  late String confirmLabel;

  void init() {
    if (widget.id == null) {
      title = 'Create a new task';
      confirmLabel = 'Create';
      todo = ToDo(
        text: '',
        done: false,
      );
    } else {
      title = 'Edit task';
      confirmLabel = 'Save';
      ToDo? getTodo = ToDoHiveBox.of(context).box.getAt(widget.id!);
      if (getTodo == null) {
        throw Exception('Task not found');
      } else {
        todo = getTodo;
      }
    }
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      if (todo.isInBox) {
        todo.save();
      } else {
        ToDoHiveBox.of(context).box.add(todo);
      }
      GoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.topCenter,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              height: 150,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onEditingComplete: submit,
                      onChanged: (value) => todo.text = value,
                      initialValue: todo.text,
                      decoration: const InputDecoration(
                        labelText: 'Task name',
                      ),
                      validator: todo.validateText,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: submit,
                      child: Text(confirmLabel),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
