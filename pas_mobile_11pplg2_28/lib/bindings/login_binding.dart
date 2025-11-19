import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/login_controller.dart';

class Loginapibinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginAPIController>(()=>LoginAPIController());
  }
}