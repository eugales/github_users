import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/users_controller.dart';

class UsersView extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => controller.getUsers(),
      child: controller.obx(
        (state) => ListView.builder(
          itemCount: state?.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Image.network(state![index].avatarUrl),
              title: Text(state[index].login),
              subtitle: Text(state[index].id.toString()),
              onTap: () {
                Get.toNamed('/details', arguments: state[index]);
              },
            );
          }),
        ),
      ),
    );
  }
}
