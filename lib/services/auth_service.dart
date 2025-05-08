import 'package:get/get.dart';

class AuthService extends GetxService {
  final isLoggedIn = false.obs;

  Future<AuthService> init() async {
    await Future.delayed(Duration(milliseconds: 500));
    isLoggedIn.value = false; // 초기 상태 (로그인 안 됨)
    return this;
  }

  void login() async {
    await Future.delayed(Duration(milliseconds: 500));
    isLoggedIn.value = true;
    print('login');
  }

  void logout() async {
    await Future.delayed(Duration(milliseconds: 500));
    isLoggedIn.value = false;
    print('logout');
  }
}
