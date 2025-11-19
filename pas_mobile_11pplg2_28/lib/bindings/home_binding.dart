import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/bottomnav_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<Bottomnavcontroller>(()=>Bottomnavcontroller());
  }

}