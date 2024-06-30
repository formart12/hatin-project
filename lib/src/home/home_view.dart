import 'package:flutter/material.dart';
import 'package:hatin/src/ui/friday_ui.dart';
import 'package:hatin/src/ui/monday_ui.dart';
import 'package:hatin/src/ui/saturday_ui.dart';
import 'package:hatin/src/ui/sunday_ui.dart';
import 'package:hatin/src/ui/thursday_ui.dart';
import 'package:hatin/src/ui/tuesday_ui.dart';
import 'package:hatin/src/ui/wednesday_ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final _tabs = <Tab>[
    const Tab(
      child: Text(
        "일",
        style: TextStyle(color: Colors.red),
      ),
    ),
    const Tab(text: "월"),
    const Tab(text: "화"),
    const Tab(text: "수"),
    const Tab(text: "목"),
    const Tab(text: "금"),
    const Tab(
        child: Text(
      "토",
      style: TextStyle(color: Colors.red),
    )),
  ];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 루틴"),
        bottom: PreferredSize(
            preferredSize: AppBar().preferredSize, child: _tabBar()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SunDayUi(),
          MonDayUi(),
          TuesDayUi(),
          WednesDay(),
          ThursDay(),
          FriDayUi(),
          SaturDay(),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
      tabs: _tabs,
    );
  }
}
