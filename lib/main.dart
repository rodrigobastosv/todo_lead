import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_lead/theme_controller.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(),
      child: App(),
    );
  }
}
