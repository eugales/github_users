import 'package:get/get.dart';
import 'package:github_users/getx_users/user_details/details_controller.dart';

class DetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController());
  }
}
