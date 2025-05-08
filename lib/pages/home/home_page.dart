import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/pages/home/home_controller.dart';
import 'package:getx_test/services/auth_service.dart';

class HomePage extends StatelessWidget {
  final auth = Get.find<AuthService>();
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: controller.logout,
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          final user = auth.user.value;
          if (user == null) return Text('로그인 정보 없음');
          return Text('${user.name}님, (${user.email}) 환영합니다!');
        }),
      ),
    );
  }
}
