import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
      bottomSheet: starthatrin(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logotext(),
        logo(),
        subtext(),
      ],
    );
  }

  Widget logotext() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey,
        ),
        Text("Hatin"),
      ],
    );
  }

  Widget logo() {
    return Container(
      width: double.infinity,
      height: 400,
      color: Colors.grey,
    );
  }

  Widget subtext() {
    return const SizedBox(
      width: double.infinity,
      child: Text(
        "루틴을 만들어서\n새로운 하루를 시작해보세요!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget starthatrin() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xffFF3D3D), Color(0xffFF7354)]),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "루틴 만들기",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );
}
