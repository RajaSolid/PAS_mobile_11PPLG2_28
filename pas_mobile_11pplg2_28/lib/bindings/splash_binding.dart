import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/splash_controller.dart';

class Splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashscreenController());
  }
}
