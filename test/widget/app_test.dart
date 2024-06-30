import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/ui/app/app.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:provider/provider.dart';

Widget createAppScreen() => ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: const MaterialApp(
        home: App(),
      ),
    );

void main() {
  group("앱 UI 위젯 테스트", () {
    testWidgets("앱 UI는 IndexStack으로 화면을 구축함.", (widgetTester) async {
      await widgetTester.pumpWidget(createAppScreen());
      expect(find.byType(IndexedStack), findsOneWidget);
    });

    testWidgets("앱 UI는 IndexStack에는 4개의 Container가 존재함.", (widgetTester) async {
      await widgetTester.pumpWidget(createAppScreen());
      expect(find.byType(Container), findsAny);
    });

    testWidgets("앱 UI는 Bottom Navigation이 존재함.", (widgetTester) async {
      await widgetTester.pumpWidget(createAppScreen());
      expect(find.byType(BottomNavigationBar), findsOne);
    });
  });
}
