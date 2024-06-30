import 'package:flutter/material.dart';
import 'package:hatin/src/ui/plus_routin_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 7,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 루틴"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _tabBar(),
            _myroutin(),
            SafeArea(
              child: _logo(),
            ),
          ],
        ),
      ),
      bottomSheet: const PlusRoutinView(),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(
          child: Text(
            "일",
            style: TextStyle(color: Colors.red),
          ),
        ),
        Tab(text: "월"),
        Tab(text: "화"),
        Tab(text: "수"),
        Tab(text: "목"),
        Tab(text: "금"),
        Tab(
            child: Text(
          "토",
          style: TextStyle(color: Colors.red),
        )),
      ],
    );
  }

  Widget _myroutin() {
    return const Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              "루틴1",
            ),
            trailing: Icon(Icons.ac_unit),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "루틴2",
            ),
            trailing: Icon(Icons.ac_unit),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "루틴3",
            ),
            trailing: Icon(Icons.ac_unit),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "루틴4",
            ),
            trailing: Icon(Icons.ac_unit),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              "루틴5",
            ),
            trailing: Icon(Icons.ac_unit),
          ),
        ),
      ],
    );
  }

  Widget _logo() {
    return Container(
      width: 300,
      height: 300,
      color: Colors.blue,
    );
  }
}
