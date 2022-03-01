import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/user_model.dart';
import 'package:github_users/users_provider.dart';

class UsersController extends GetxController with StateMixin<List<UserModel>> {
  final UsersProvider usersProvider;
  UsersController({required this.usersProvider});

  ScrollController scrollController = ScrollController();
  int listLength = 30;
  int since = 0;

  @override
  void onInit() {
    getUsers(since: since);
    addUsers();
    super.onInit();
  }

  void getUsers({int since = 0, refresh = false}) {
    if (refresh) since = 0;

    usersProvider.getUsers(since: since).then((result) {
      List<UserModel>? data = result.body;
      if (data != null) {
        change(data, status: RxStatus.success());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void addUsers() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        since += listLength;
        usersProvider.getUsers(since: since).then((result) {
          List<UserModel>? data = result.body;
          if (data != null) {
            if (state != null) {
              for (var newElement in data) {
                bool isNotExist = state!.where((element) => element.id == newElement.id).isEmpty;
                state!.addIf(isNotExist, newElement);
              }

              change(state, status: RxStatus.loadingMore());
            }
          }
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
        });
      }
    });
  }
}
