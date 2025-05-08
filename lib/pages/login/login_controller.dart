import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:getx_test/services/auth_service.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;

  final auth = Get.find<AuthService>();

  void login() {
    if (email.isNotEmpty && password.isNotEmpty) {
      auth.login(email.value, password.value);
      // 로그인 성공 후 홈 화면으로 이동 (이전 화면 제거)
      Get.offAllNamed(AppRoutes.HOME);
    }
  }
}
