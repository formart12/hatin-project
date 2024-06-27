import 'package:flutter/material.dart';
import 'package:hatin/src/app/app.dart';
import 'package:hatin/src/viewmodel/app_view_model.dart';
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: App(),
      ),
    );
  }
}
