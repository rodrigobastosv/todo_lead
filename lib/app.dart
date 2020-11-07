import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/todo/todo_page.dart';
import 'theme_controller.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, controller, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: controller.themeMode == ThemeMode.light
              ? Brightness.light
              : Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoPage(),
      ),
    );
  }
}