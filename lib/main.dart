import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 환경 변수 로드
  await dotenv.load(fileName: 'assets/.env');
  print('Loaded .env: ${dotenv.env}');
  // Supabase 초기화
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

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
