import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lead/model/todo_model.dart';

import '../../theme_controller.dart';
import 'todo_controller.dart';

class TodoFormView extends StatefulWidget {
  TodoFormView({
    this.todo,
  });

  final TodoModel todo;

  @override
  _TodoFormViewState createState() => _TodoFormViewState();
}

class _TodoFormViewState extends State<TodoFormView> {
  final _formKey = GlobalKey<FormState>();
  TodoModel todo;

  @override
  void initState() {
    todo = widget.todo ??
        TodoModel(
          isDone: false,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final todoController = context.watch<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lead Flutter Todo App'),
        actions: [
          IconButton(
            icon: themeController.isUsingDarkMode()
                ? Icon(Icons.wb_sunny)
                : Icon(Icons.nights_stay),
            onPressed: () => themeController.isUsingDarkMode()
                ? themeController.setThemeMode(ThemeMode.light)
                : themeController.setThemeMode(ThemeMode.dark),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: todo.description,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Description',
                  ),
                  validator: (description) =>
                      description.isEmpty ? 'Required field' : null,
                  onSaved: (description) => todo.description = description,
                ),
                CheckboxListTile(
                  title: Text('Is done?'),
                  value: todo.isDone,
                  onChanged: (value) => setState(() => todo.isDone = value),
                ),
                RaisedButton(
                  onPressed: () {
                    final _form = _formKey.currentState;
                    if (_form.validate()) {
                      _form.save();
                      if (todo.id == null) {
                        final randomId = Random().nextInt(999);
                        todo.id = randomId;
                        todoController.addTodo(todo);
                      } else {
                        todoController.editTodo(todo);
                      }

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
