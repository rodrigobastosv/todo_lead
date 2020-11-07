import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lead/page/todo/todo_controller.dart';
import 'package:test_lead/page/todo/todo_list_view.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoController>(
      create: (_) => TodoController(),
      child: TodoListView(),
    );
  }
}
