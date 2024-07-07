import 'package:flutter/material.dart';
import 'package:hatin/src/ui/routine/routin_delete_view.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:hatin/src/ui/routine/routine_view.dart';
import 'package:provider/provider.dart';

class RoutinPage extends StatelessWidget {
  const RoutinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RoutinViewModel>(builder: (context, provider, child) {
      return IndexedStack(
        index: (provider.isEdit) ? 1 : 0,
        children: const [RoutineView(), RoutinDeleteView()],
      );
    });
  }
}
