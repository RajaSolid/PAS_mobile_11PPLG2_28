import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();

    // 🔹 Arahkan ke halaman login API
    Get.offAllNamed(AppRoutes.login);
  }
}
