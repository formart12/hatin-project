import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatin/src/widget/gradient_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _text(),
            _inputField("아이디", "아이디를 입력해주세요.", false),
            _findid(),
            _inputField("비밀번호", "비밀번호를 입력해주세요.", true),
            _findpassword(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: GradientButton(
                label: "로그인하기",
                onPressed: () {},
              ),
            ),
            _btnsignup(),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 100,
      child: const Text(
        "로그인",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color(0xff111111),
        ),
      ),
    );
  }

  Widget _inputField(String label, String hintText, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF1F3F5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xff9B9B9B),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _findid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "아이디 기억하기",
          style: TextStyle(
            color: Color(0xff9B9B9B),
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "아이디 찾기",
            style: TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _findpassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "비밀번호를 잊으셨나요?",
          style: TextStyle(
            color: Color(0xff9B9B9B),
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "비밀번호 찾기",
            style: TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _btnsignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "아이디가 없으신가요?",
            style: TextStyle(fontSize: 16, color: Color(0xff9B9B9B)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "회원가입",
              style: TextStyle(fontSize: 16, color: Color(0xff9b9b9b)),
            ),
          ),
        ],
      ),
    );
  }
}
