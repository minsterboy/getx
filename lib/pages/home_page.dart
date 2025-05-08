import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthService>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('환영합니다!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                auth.logout(); // 로그아웃 시 LoginPage로 자동 이동
              },
              child: Text('로그아웃'),
            )
          ],
        ),
      ),
    );
  }
}
