import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/ui/routine/routin_add_page.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:provider/provider.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({super.key});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: AppBar().preferredSize.height * 3,
        ),
        _header(),
        _addRoutin(),
        _dailyRoutins(),
        const SizedBox(
          height: 120,
        )
      ]),
    );
  }

  Widget _header() => SizedBox(
        height: AppBar().preferredSize.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "오늘 하루루틴",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed:
                      Provider.of<RoutinViewModel>(context, listen: false).edit,
                  child: const Text(
                    "전체 편집",
                    style: TextStyle(color: Color(0xffa8a8a8)),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _addRoutin() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RoutinAddPage()));
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
            width: double.infinity,
            height: 86,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xffFF3D3D), Color(0xffFF7354)]),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "루틴 추가하기",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xffb9b9b9),
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _dailyRoutins() => Consumer<RoutinViewModel>(
      builder: (context, provider, child) => Column(
            children: List.generate(provider.routins.length, (index) {
              final Routin routin = provider.routins[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 86,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            routin.name,
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            routin.startAt,
                            style: const TextStyle(color: Color(0xffb9b9b9)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ));
}
