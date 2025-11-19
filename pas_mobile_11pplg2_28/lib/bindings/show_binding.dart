import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/show_controller.dart';

class ShowBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(TableShow());
  }
}