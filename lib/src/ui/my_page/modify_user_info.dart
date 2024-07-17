import 'package:flutter/material.dart';
import 'package:hatin/src/ui/my_page/change_password.dart';
import 'package:hatin/src/ui/my_page/change_user_info.dart';
import 'package:hatin/src/widget/service_button.dart';
import 'package:hatin/src/widget/user_text_field_button.dart';

class ModifyUserInfo extends StatefulWidget {
  const ModifyUserInfo({super.key});

  @override
  State<ModifyUserInfo> createState() => _ModifyUserInfoState();
}

class _ModifyUserInfoState extends State<ModifyUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: _body()),
            _deleteAccount(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserTextFieldButton(
              label: "닉네임 변경", buttonTitle: "변경 ", onButtonPressed: () {}),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ServiceButton(
                label: "회원정보 변경",
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangeUserInfo(),
                    ),
                  );
                }),
          ),
          ServiceButton(
              label: "비밀번호 변경",
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _deleteAccount() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 200,
      child: TextButton(
        onPressed: () {},
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "계정 삭제",
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff9B9B9B),
                decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}
