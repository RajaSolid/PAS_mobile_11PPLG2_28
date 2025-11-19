import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin() async {
  print("SplashScreenController: mulai cek login...");
  final prefs = await SharedPreferences.getInstance();
  await Future.delayed(const Duration(seconds: 3));

  final token = prefs.getString("token");
  print("Token dari prefs: $token");

  if (token != null && token.isNotEmpty) {
    print("Pindah ke mainpage");
    Get.offAllNamed(AppRoutes.home);
  } else {
    print("Pindah ke loginapipage");
    Get.offAllNamed(AppRoutes.login);
  }
}

}
