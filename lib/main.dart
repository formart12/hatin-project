import 'package:flutter/material.dart';
import 'package:hatin/src/ui/app/app.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/routine/routin_add_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: false,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: const Color(0xffefefef),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                titleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff111111))),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Color(0xffd9d9d9),
                selectedItemColor: Color(0xffFE4F28))),
        routes: {
          "/": (context) => const App(),
          "/routinAddPage": (context) => const RoutinAddPage(),
        },
        initialRoute: "/",
      ),
    );
  }
}
