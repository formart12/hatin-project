import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/widget/custom_outlined_button.dart';

void main() {
  group("Custon Outlined Button 위젯 테스트", () {
    testWidgets("버튼의 label이 잘 지정되는지", (testWidget) async {
      Widget createCustomOutlinedButton() => MaterialApp(
            home: Scaffold(
              body: CustomOutlinedButton(label: "label", onPressed: () {}),
            ),
          );

      await testWidget.pumpWidget(createCustomOutlinedButton());
      expect(find.byType(CustomOutlinedButton), findsOneWidget);
      expect(find.text("label"), findsOneWidget);
    });

    testWidgets("버튼의 액션함수가 잘 지정되는지", (testWidget) async {
      List<String> log = [];
      Widget createCustomOutlinedButton() => MaterialApp(
            home: Scaffold(
              body: CustomOutlinedButton(
                label: "label",
                onPressed: () {
                  log.add("tap");
                },
              ),
            ),
          );

      await testWidget.pumpWidget(createCustomOutlinedButton());
      expect(find.byType(CustomOutlinedButton), findsOneWidget);
      expect(log.length, 0);
      await testWidget.tap(find.byType(CustomOutlinedButton));
      expect(log.length, 1);
      expect(log[0], "tap");
    });

    testWidgets("버튼의 액션함수를 지정하지 않은 경우 assert 에러가 발생하는지", (testWidget) async {
      Widget createCustomOutlinedButton() => MaterialApp(
            home: Scaffold(
              body: CustomOutlinedButton(
                label: "label",
              ),
            ),
          );

      expect(() => createCustomOutlinedButton(), throwsAssertionError);
    });
  });
}
