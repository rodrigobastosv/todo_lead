import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test_lead/app.dart';
import 'package:test_lead/page/todo/todo_page.dart';
import 'package:test_lead/theme_controller.dart';

void main() {
  testWidgets(
    'app shows TodoPage as home',
    (tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<ThemeController>(
          create: (_) => ThemeController(),
          child: App(),
        ),
      );
      expect(find.byType(TodoPage), findsOneWidget);
    },
  );
}
