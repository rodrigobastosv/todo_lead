import 'package:flutter/material.dart';
import 'package:test_lead/model/todo_model.dart';

class TodoController extends ChangeNotifier {
  final todos = <TodoModel>[];

  void addTodo(TodoModel todo) {
    todos.add(todo);
    notifyListeners();
  }

  void editTodo(TodoModel todo) {
    final todoToDelete = todos.firstWhere((t) => todo.id == t.id);
    todos.remove(todoToDelete);
    todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(TodoModel todoDelete) {
    final todoToDelete = todos.firstWhere((todo) => todoDelete.id == todo.id);
    todos.remove(todoToDelete);
    notifyListeners();
  }
}
