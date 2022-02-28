import 'package:get/get.dart';
import 'package:github_users/model/user.dart';
import 'package:github_users/repo/users_repo.dart';

class UsersController extends GetxController {
  UsersRepo repo;

  final users = Future.value(<User>[]).obs;

  UsersController({required this.repo});

  void getUsers() async {
    users.value = repo.getUsers();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
