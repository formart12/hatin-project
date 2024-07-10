import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _text(),
          _loginid(),
          _loginpassword(),
          _btnlogin(),
          _btnsignup(),
        ],
      ),
    );
  }

  Widget _text() {
    return const SafeArea(
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.circle,
              color: Color(0xffE5E5E5),
            ),
            Text(
              "로그인",
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginid() {
    return Column(
      children: [
        const SizedBox(width: double.infinity, child: Text("아이디")),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "아이디를 입력해주세요.",
              ),
            ),
          ),
        ),
        TextButton(onPressed: () {}, child: const Text("아이디를 잊으셨나요?")),
      ],
    );
  }

  Widget _loginpassword() {
    return Column(
      children: [
        const SizedBox(width: double.infinity, child: Text("비밀번호")),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "비밀번호를 입력해주세요.",
              ),
            ),
          ),
        ),
        TextButton(onPressed: () {}, child: const Text("비밀번호를 잊으셨나요?")),
      ],
    );
  }

  Widget _btnlogin() => SafeArea(
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
                  "로그인하기",
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

  Widget _btnsignup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("아이디가 없으신가요?"),
        TextButton(
          onPressed: () {},
          child: const Text("회원가입"),
        ),
      ],
    );
  }
}
