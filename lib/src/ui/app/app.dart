import 'package:flutter/material.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/home/home_view.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
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
      bottomNavigationBar: _bottomNavigationBar(),
      extendBody: true,
    );
  }

  Widget _body() => Consumer<AppViewModel>(
        builder: (context, provider, child) => IndexedStack(
          index: provider.pageIndex,
          children: [
            const HomeView(),
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
      (!Provider.of<RoutinViewModel>(context).isEdit)
          ? Consumer<AppViewModel>(builder: (context, provider, child) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    currentIndex: provider.pageIndex,
                    onTap: provider.changeIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Rotin"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Feed"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "MyPage"),
                    ]),
              );
            })
          : GestureDetector(
              onTap: () {
                Provider.of<RoutinViewModel>(context, listen: false)
                    .showDeleteDialog(context);
              },
              child: Container(
                height: 88,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.white),
                child: const SafeArea(
                  child: Text(
                    "삭제",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFE4F28)),
                  ),
                ),
              ),
            );
}
