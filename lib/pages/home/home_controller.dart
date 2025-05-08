import 'package:get/get.dart';
import 'package:getx_test/app/routes/app_pages.dart';
import 'package:getx_test/services/auth_service.dart';

class HomeController extends GetxController {
  final auth = Get.find<AuthService>();

  void logout() {
    auth.logout();
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
