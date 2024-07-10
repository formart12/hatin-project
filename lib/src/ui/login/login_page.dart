import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            _textid(),
            _userid(),
            _findid(),
            _textpassword(),
            _userpassword(),
            _findpassword(),
            _btnlogin(),
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

  Widget _textid() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "아이디",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _userid() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF1F3F5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "아이디를 입력해주세요.",
              hintStyle: TextStyle(
                color: Color(0xff9B9B9B),
              )),
        ),
      ),
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

  Widget _textpassword() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "비밀번호",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _userpassword() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF1F3F5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "비밀번호를 입력해주세요.",
              hintStyle: TextStyle(
                color: Color(0xff9B9B9B),
              )),
        ),
      ),
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

  Widget _btnlogin() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GestureDetector(
          onTap: () {
            print("눌림");
          },
          child: Container(
            width: double.infinity,
            height: 56,
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
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      );

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
