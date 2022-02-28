import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:github_users/model/user.dart';
import 'package:github_users/repo/persist/users_persist.dart';
import 'package:github_users/repo/service/users_service.dart';
import 'package:github_users/repo/users_repo.dart';

class UsersController extends GetxController {
  UsersRepo repo;

  List<User> users = [];

  UsersController({required this.repo});

  void getUsers() async {
    users = await repo.getUsers();
    update();
  }
}
