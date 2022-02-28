import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:github_users/getx_users/user_details/details_bindings.dart';
import 'package:github_users/getx_users/user_details/details_view.dart';
import 'package:github_users/getx_users/users_list/users_bindings.dart';
import 'package:github_users/getx_users/users_list/users_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/users',
      getPages: [
        GetPage(name: '/users', page: () => const UsersView(), binding: UsersBinding()),
        GetPage(name: '/details', page: () => DetailsView(), binding: DetailsBindings())
      ],
    );
  }
}