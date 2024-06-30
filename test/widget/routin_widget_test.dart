import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/widget/routin_widget.dart';

Widget createRoutinWidget() => const MaterialApp(
      home: RoutinWidget(),
    );

void main() {
  group("루틴 위젯 UI 테스트", () {
    testWidgets("루틴 위젯은 루틴 이름, 루틴 기간, 완료 여부로 구성되어 있다.", (widgetTester) async {
      await widgetTester.pumpWidget(createRoutinWidget());
      expect(find.text("루틴 이름"), findsOneWidget);
      expect(find.text("00:00 ~ 00:00"), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}
