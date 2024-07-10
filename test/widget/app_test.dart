import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/repository/routin_repository.dart';
import 'package:hatin/src/service/routin_service.dart';
import 'package:hatin/src/ui/app/app.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/home/home_view.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:hatin/src/widget/hatin_dialog.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';
import 'package:provider/provider.dart';

Widget _createApp() => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppViewModel()),
        ChangeNotifierProvider(
            create: (context) => RoutinViewModel(
                routinService:
                    RoutinService(routinRepository: RoutinRepository()))),
      ],
      child: const MaterialApp(
        home: App(),
      ),
    );

void main() {
  group("앱 UI 테스트", () {
    testWidgets("앱 BODY 위젯 테스트", (testWidget) async {
      await testWidget.pumpWidget(_createApp());
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(Container), findsAtLeast(3));
    });

    testWidgets("앱 BOTTOM 위젯 테스트", (testWidget) async {
      await testWidget.pumpWidget(_createApp());
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byType(HattinImageIcon), findsAtLeast(4));
    });

    testWidgets("앱 전체편집 테스트", (testWidget) async {
      await testWidget.pumpWidget(_createApp());
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byKey(const Key("AppBottomNav")), findsOneWidget);
      await testWidget.tap(find.byKey(const Key("전체 편집")));
      await testWidget.pumpAndSettle();

      expect(find.byKey(const Key("AppBottomNav")), findsNothing);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byKey(const Key("RoutinDelBtn")), findsOneWidget);
      expect(find.byKey(const Key("RoutinSelectTool")), findsOneWidget);
    });

    testWidgets("사용자가 전체 편집을 탭한 후 아무것도 선택하지 않으면 다이얼로그가 나타나지 않는다",
        (testWidget) async {
      await testWidget.pumpWidget(_createApp());
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      await testWidget.tap(find.byKey(const Key("전체 편집")));
      await testWidget.pumpAndSettle();
      await testWidget.runAsync(() async {
        await testWidget.tap(find.byKey(const Key("RoutinDelBtn")));
      });
      await testWidget.pumpAndSettle();
      expect(find.byType(HatinDialog), findsNothing);
    });

    testWidgets("사용자가 전체 편집을 탭한 후 루틴을 선택하면 다이얼로그가 나타난다", (testWidget) async {
      await testWidget.pumpWidget(_createApp());
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      await testWidget.tap(find.byKey(const Key("전체 편집")));
      await testWidget.pumpAndSettle();
      await testWidget.tap(find.byKey(const Key("allSelectTextBtn")));
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      await testWidget.runAsync(() async {
        await testWidget.tap(find.byKey(const Key("RoutinDelBtn")));
      });
      await testWidget.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(HatinDialog), findsOneWidget);
    });
  });
}
