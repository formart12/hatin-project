import 'package:flutter/material.dart';
import 'package:hatin/src/ui/login/find_email.dart';
import 'package:hatin/src/ui/login/find_password.dart';
import 'package:hatin/src/ui/login/login_signup_page1.dart';
import 'package:hatin/src/widget/gradient_button.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';
import 'package:hatin/src/widget/user_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
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
            _centerImage(),
            const UserTextField(
                label: "이메일",
                hintText: "예) Hatin@hain.co.kr",
                isPassword: false),
            const UserTextField(
                label: "비밀번호", hintText: "비밀번호를 입력해주세요.", isPassword: true),
            _findpassword(),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GradientButton(
                label: "로그인하기",
                onPressed: () {},
              ),
            ),
            btnSignup(),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "로그인",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff111111),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.8),
              child: Text(
                "이메일과 비밀번호를 입력해주세요",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff9B9B9B),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _centerImage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 173,
        height: 96,
        child: FittedBox(
          fit: BoxFit.contain,
          child: HattinImageIcon(path: ImagePath.signupCenter),
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

  Widget btnSignup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FindEmail()));
          },
          child: const Text(
            "이메일 찾기",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9b9b9b),
            ),
          ),
        ),
        const Text(
          "|",
          style: TextStyle(fontSize: 14, color: Color(0xff9b9b9b)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FindPassword()));
          },
          child: const Text(
            "비밀번호 찾기",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9b9b9b),
            ),
          ),
        ),
        const Text(
          "|",
          style: TextStyle(fontSize: 14, color: Color(0xff9b9b9b)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginSignup1()));
          },
          child: const Text(
            "회원가입하기",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9b9b9b),
            ),
          ),
        ),
      ],
    );
  }
}
