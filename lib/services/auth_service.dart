import 'package:get/get.dart';
import 'package:getx_test/models/user_model.dart';

class AuthService extends GetxService {
  //돌려 쓸 사용자 정보
  Rx<AppUser?> user = Rx<AppUser?>(null);

  // 로그인 여부를 저장하는 observable 변수
  bool get isLoggedIn => user.value != null;

  void login(String email, String password) {
    // 여기에서 실제 로그인 요청을 보내고 성공 응답을 받은 후 아래처럼 저장
    user.value = AppUser(name: '홍길동', email: email);
  }

  void logout() {
    user.value = null;
  }

  // 앱 시작 시 로그인 상태 확인 등 초기화 함수
  Future<AuthService> init() async {
    // 예: SharedPreferences나 SecureStorage에서 토큰 확인 가능
    // isLoggedIn.value = true; // 자동 로그인 처리 가능
    return this;
  }
}
