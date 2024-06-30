import 'package:flutter/material.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/home/home_view.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() => Consumer<AppViewModel>(
        builder: (context, provider, child) => IndexedStack(
          index: provider.pageIndex,
          children: [
            const HomeView(), // 홈 UI
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      );

  Widget _bottomNavigationBar() =>
      Consumer<AppViewModel>(builder: (context, provider, child) {
        return BottomNavigationBar(
            currentIndex: provider.pageIndex,
            onTap: provider.changeIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Rotin"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Feed"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "MyPage"),
            ]);
      });
}
