import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/widget/gradient_button.dart';

void main() {
  group("Gradient Button Widget 테스트", () {
    testWidgets("버튼의 레이블이 잘 전달되는지", (testWidget) async {
      Widget createGradientButton() => MaterialApp(
            home: Scaffold(
              body: GradientButton(
                label: "로그인",
                onPressed: () {},
              ),
            ),
          );
      await testWidget.pumpWidget(createGradientButton());
      expect(find.byType(GradientButton), findsOneWidget);
      expect(find.text("로그인"), findsOneWidget);
    });

    testWidgets("버튼의 액션함수가 잘 작동하는지", (testWidget) async {
      List<String> log = [];
      Widget createGradientButton() => MaterialApp(
            home: Scaffold(
              body: GradientButton(
                label: "로그인",
                onPressed: () {
                  log.add("tap");
                },
              ),
            ),
          );

      await testWidget.pumpWidget(createGradientButton());
      expect(find.byType(GradientButton), findsOneWidget);
      expect(log.length, 0);
      await testWidget.tap(find.byType(GradientButton));
      expect(log.length, 1);
      expect(log[0], "tap");
    });

    testWidgets("버튼의 액션함수가 지정되지 않은 경우 assertError가 발생하는지", (testWidget) async {
      Widget createGradientButton() => MaterialApp(
            home: Scaffold(
              body: GradientButton(label: "로그인"),
            ),
          );
      expect(() => createGradientButton(), throwsAssertionError);
    });
  });
}
