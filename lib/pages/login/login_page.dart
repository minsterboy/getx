import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/pages/login/login_controller.dart';

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
          ],
        ),
      ),
    );
  }
}
