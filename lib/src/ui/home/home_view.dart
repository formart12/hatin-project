import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hatin/src/ui/routine/routine_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  var now = DateTime.now();
  late final startOfWeek;
  final _weekDay = [
    "월",
    "화",
    "수",
    "목",
    "금",
    "토",
    "일",
  ];
  late final TabController _tabController;

  @override
  void initState() {
    // 탭바를 사용하려면 initState 가 필요함.
    super.initState();
    _tabController = TabController(
      length: _weekDay.length,
      vsync: this,
      initialIndex: now.weekday - 1,
    );
    startOfWeek = now.day - (now.weekday - 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize * 2,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(32.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0,
              sigmaY: 4.0,
            ),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                    blurStyle: BlurStyle.normal)
              ]),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white.withOpacity(0.75),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(32.0))),
                centerTitle: false,
                title: Text(DateFormat("yyyy년 M월 d일").format(DateTime.now())),
                bottom: PreferredSize(
                    preferredSize: AppBar().preferredSize, child: _tabBar()),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: List.generate(7, (index) => const RoutineView())),
      extendBodyBehindAppBar: true,
    );
  }

  Widget _tabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TabBar(
        controller: _tabController,
        indicator: const BoxDecoration(color: Color(0xffFFC6B9)),
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        tabs: List.generate(
            _weekDay.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          _weekDay[index],
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          (startOfWeek + index).toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
