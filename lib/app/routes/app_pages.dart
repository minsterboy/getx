import 'package:get/get.dart';
import 'package:getx_test/app/bindings/home_binding.dart';
import 'package:getx_test/app/bindings/login_binding.dart';
import 'package:getx_test/pages/home/home_page.dart';
import 'package:getx_test/pages/login/login_page.dart';
import 'package:getx_test/pages/splash/splash_page.dart';

class AppRoutes {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const HOME = '/home';
}

final List<GetPage> appPages = [
  GetPage(
    name: AppRoutes.SPLASH,
    page: () => SplashPage(),
  ),
  GetPage(
    name: AppRoutes.LOGIN,
    page: () => LoginPage(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: AppRoutes.HOME,
    page: () => HomePage(),
    binding: HomeBinding(),
  ),
];
