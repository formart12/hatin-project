import 'package:flutter/material.dart';

class LoginSignup1 extends StatelessWidget {
  const LoginSignup1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _signuptext(),
          _signupemail(),
          _signuppassword(),
          _signupckpassword(),
          _btnnextsignup(),
        ],
      ),
    );
  }

  Widget _signuptext() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.circle,
              color: Color(0xffE5E5E5),
            ),
            Text(
              "회원가입",
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _signupemail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
              width: double.infinity, child: Text("이메일 (닉네임으로 사용됩니다.)")),
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
                  hintText: "이메일을 입력해주세요.",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signuppassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
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
                  hintText: "비밀번호를 입력하세요.",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signupckpassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          const SizedBox(width: double.infinity, child: Text("비밀번호 확인")),
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
                  hintText: "비밀번호를 입력하세요.",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnnextsignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "다음단계",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
