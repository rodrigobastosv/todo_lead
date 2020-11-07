import 'package:flutter_test/flutter_test.dart';
import 'package:test_lead/model/todo_model.dart';
import 'package:test_lead/page/todo/todo_controller.dart';

void main() {
  group('TodoController tests', () {
    TodoController todoController;

    setUp(() {
      todoController = TodoController();
    });

    test('starts with empty todos', () {
      expect(todoController.todos, isEmpty);
    });

    test('addTodo adds a todo', () {
      todoController.addTodo(TodoModel());
      expect(todoController.todos.length, 1);
    });

    test('deleteTodo deletes a todo', () {
      todoController.addTodo(
        TodoModel(
          id: 1,
        ),
      );
      todoController.deleteTodo(
        TodoModel(
          id: 1,
        ),
      );
      expect(todoController.todos, isEmpty);
    });

    test('editTodo edits a todo', () {
      todoController.addTodo(
        TodoModel(
          id: 1,
          description: 'teste',
        ),
      );
      todoController.editTodo(
        TodoModel(
          id: 1,
          description: 'teste editado',
        ),
      );
      expect(todoController.todos[0].description, 'teste editado');
    });
  });
}
