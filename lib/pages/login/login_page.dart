import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/pages/login/login_controller.dart';
import 'package:getx_test/pages/signup/signup_page.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (v) => controller.email.value = v,
              decoration: InputDecoration(labelText: '이메일'),
            ),
            TextField(
              onChanged: (v) => controller.password.value = v,
              decoration: InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.login,
              child: Text('로그인'),
            ),
            TextButton(
              onPressed: () {
                // 회원가입 페이지로 이동
                Get.to(() => SignupPage());
              },
              child: Text('회원가입'),
            )
          ],
        ),
      ),
    );
  }
}
