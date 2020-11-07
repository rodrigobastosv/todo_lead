import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test_lead/page/todo/todo_controller.dart';
import 'package:test_lead/page/todo/todo_form_view.dart';
import 'package:test_lead/page/todo/todo_list_view.dart';
import 'package:test_lead/theme_controller.dart';

void main() {
  group('TodoListView tests', () {
    ThemeController themeController;
    TodoController todoController;

    setUp(() {
      themeController = ThemeController();
      todoController = TodoController();
    });

    testWidgets(
      'todo list renders no todo',
      (tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider<ThemeController>.value(
            value: themeController,
            child: ChangeNotifierProvider<TodoController>.value(
              value: todoController,
              child: MaterialApp(
                home: TodoListView(),
              ),
            ),
          ),
        );
        expect(find.byType(ListTile), findsNothing);
      },
    );

    testWidgets(
      'goes to form page when click fab',
      (tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider<ThemeController>(
            create: (_) => ThemeController(),
            child: ChangeNotifierProvider<TodoController>(
              create: (_) => TodoController(),
              child: MaterialApp(
                home: TodoListView(),
              ),
            ),
          ),
        );
        final fab = find.byType(FloatingActionButton);
        await tester.tap(fab);
        await tester.pumpAndSettle();
        expect(find.byType(TodoFormView), findsOneWidget);
      },
    );

    /*testWidgets(
      'todo list renders todos when there is some',
      (tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider<ThemeController>.value(
            value: themeController,
            child: ChangeNotifierProvider<TodoController>.value(
              value: todoController,
              child: MaterialApp(
                home: TodoListView(),
              ),
            ),
          ),
        );
        todoController.addTodo(
          TodoModel(
            id: 1,
          ),
        );
        expect(find.byType(ListTile), findsOneWidget);
      },
    );*/
  });
}
