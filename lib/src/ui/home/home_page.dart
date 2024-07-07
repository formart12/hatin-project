import 'package:flutter/material.dart';
import 'package:hatin/src/repository/routin_repository.dart';
import 'package:hatin/src/service/routin_service.dart';
import 'package:hatin/src/ui/home/home_view.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoutinViewModel(
          routinService: RoutinService(routinRepository: RoutinRepository())),
      child: const HomeView(),
    );
  }
}
