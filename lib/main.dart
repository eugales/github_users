import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:github_users/getx/users/users_bindings.dart';
import 'package:github_users/getx/users/users_view.dart';

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
        GetPage(name: '/users', page: () => const UsersView(), binding: UsersBinding())
      ],
    );
  }
}