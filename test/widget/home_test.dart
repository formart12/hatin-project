import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/repository/routin_repository.dart';
import 'package:hatin/src/service/routin_service.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/home/home_view.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:provider/provider.dart';

Widget creatHomeViewWidget() => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppViewModel()),
        ChangeNotifierProvider(
            create: (context) => RoutinViewModel(
                routinService:
                    RoutinService(routinRepository: RoutinRepository()))),
      ],
      child: const MaterialApp(
        home: HomeView(),
      ),
    );
void main() {
  group("홈 UI 위젯 테스트", () {
    testWidgets("홈 UI는 탭바뷰로 구성된다.", (widgetTester) async {
      await widgetTester.pumpWidget(creatHomeViewWidget());
      await widgetTester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
    });
  });
}
