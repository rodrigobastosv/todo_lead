import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lead/page/todo/todo_form_view.dart';

import '../../theme_controller.dart';
import 'todo_controller.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
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
      body: Consumer<TodoController>(
        builder: (context, controller, child) {
          return ListView.separated(
            itemBuilder: (_, i) => ListTile(
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => ChangeNotifierProvider.value(
                    value: context.read<TodoController>(),
                    child: TodoFormView(todo: controller.todos[i]),
                  ),
                ),
              ),
              leading: Text('${i + 1}'),
              title: Text(
                controller.todos[i].description,
                style: new TextStyle(
                  color: Colors.grey,
                  decoration: controller.todos[i].isDone
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () => context
                    .read<TodoController>()
                    .deleteTodo(controller.todos[i]),
              ),
            ),
            separatorBuilder: (_, i) => Divider(),
            itemCount: controller.todos.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: context.read<TodoController>(),
              child: TodoFormView(),
            ),
          ),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
