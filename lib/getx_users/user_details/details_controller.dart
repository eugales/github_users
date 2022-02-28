import 'package:get/get.dart';
import 'package:github_users/model/user.dart';


class DetailsController extends GetxController {
  final user = User(
    id: 1,
    login: 'login',
    avatarUrl: 'avatarUrl',
    followers: 0,
    following: 0,
    createdAt: 'createdAt',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    user.value = Get.arguments;
  }
}
