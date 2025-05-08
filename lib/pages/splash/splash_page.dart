import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:getx_test/services/auth_service.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final auth = Get.find<AuthService>();

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    await Future.delayed(Duration(seconds: 1)); // 로딩 효과용 (선택)

    if (auth.isLoggedIn) {
      Get.offAllNamed(AppRoutes.HOME);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Loading...'),
          CircularProgressIndicator(),
        ],
      )),
    );
  }
}
