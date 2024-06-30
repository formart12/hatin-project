import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/home/home_view.dart';

Widget creatHomeViewWidget() => const MaterialApp(
      home: HomeView(),
    );
void main() {
  group("홈 UI 위젯 테스트", () {
    testWidgets("홈 UI는 탭바뷰로 구성된다.", (widgetTester) async {
      await widgetTester.pumpWidget(creatHomeViewWidget());

      expect(find.byType(TabBar), findsOneWidget);
    });
  });
}
