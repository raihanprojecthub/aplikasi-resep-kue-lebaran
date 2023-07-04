import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'adminresep' && password == 'admin123') {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      isLogin = true;
    }
    return isLogin;
  }
}
