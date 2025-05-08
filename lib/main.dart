import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => AuthService().init()); // AuthService 전역 등록
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH, // 무조건 Splash로 시작
      getPages: appPages,
    );
  }
}
