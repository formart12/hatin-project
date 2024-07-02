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
        routes: {
          "/": (context) => const App(),
          "/routinAddPage": (context) => const RoutinAddPage(),
        },
        initialRoute: "/",
      ),
    );
  }
}
