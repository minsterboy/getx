import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/pages/signup/signup_controller.dart';

class SignupPage extends StatelessWidget {
  final controller = Get.put(SignupController());

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원가입')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (v) => controller.email.value = v,
              decoration: InputDecoration(labelText: '이메일'),
            ),
            TextField(
              onChanged: (v) => controller.name.value = v,
              decoration: InputDecoration(labelText: '사용자이름'),
            ),
            TextField(
              onChanged: (v) => controller.password.value = v,
              decoration: InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.signup,
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
