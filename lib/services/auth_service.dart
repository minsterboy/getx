import 'package:get/get.dart';
import 'package:getx_test/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  Rx<AppUser?> user = Rx<AppUser?>(null);
  bool get isLoggedIn => user.value != null;

  final _supabase = Supabase.instance.client;

  Future<void> signup(String email, String password, String name) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      final authUser = response.user;

      if (authUser != null) {
        final newUser = AppUser(
          id: authUser.id,
          name: name,
        );

        // Supabase users 테이블에 삽입
        await _supabase.from('users').insert(newUser.toJson());

        user.value = newUser;
      }
    } on AuthException catch (e) {
      Get.snackbar('회원가입 실패', e.message);
    } catch (e) {
      Get.snackbar('오류', '회원가입 중 문제가 발생했습니다.');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final session = response.session;
      final authUser = response.user;

      if (session != null && authUser != null) {
        final userRes = await _supabase
            .from('users')
            .select()
            .eq('id', authUser.id)
            .maybeSingle();

        if (userRes != null) {
          user.value = AppUser.fromJson(userRes);
        } else {
          Get.snackbar('오류', '사용자 정보가 존재하지 않습니다.');
        }
      }
    } on AuthException catch (e) {
      Get.snackbar('로그인 실패', e.message);
    } catch (e) {
      Get.snackbar('오류', '예기치 못한 오류가 발생했습니다.');
    }
  }

  void logout() async {
    await _supabase.auth.signOut();
    user.value = null;
  }

  Future<AuthService> init() async {
    final session = _supabase.auth.currentSession;
    final authUser = _supabase.auth.currentUser;

    if (session != null && authUser != null) {
      final userRes = await _supabase
          .from('users')
          .select()
          .eq('id', authUser.id)
          .maybeSingle();

      if (userRes != null) {
        user.value = AppUser.fromJson(userRes);
      }
    }

    return this;
  }
}
