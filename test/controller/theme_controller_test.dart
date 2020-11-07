import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_lead/theme_controller.dart';

void main() {
  group('ThemeController tests', () {
    ThemeController themeController;
  
    setUp(() {
      themeController = ThemeController();
    });

    test('ThemeController starts with ThemeMode.light', () {
      expect(themeController.themeMode, ThemeMode.light);
    });

    test('setThemeMode sets the controller theme mode', () {
      themeController.setThemeMode(ThemeMode.dark);
      expect(themeController.themeMode, ThemeMode.dark);
    });

    test('isUsingDarkMode works', () {
      expect(themeController.isUsingDarkMode(), false);
      themeController.setThemeMode(ThemeMode.dark);
      expect(themeController.isUsingDarkMode(), true);
    });
  });
}
