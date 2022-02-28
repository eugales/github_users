import 'dart:convert';

import 'package:github_users/model/user.dart';

import 'package:http/http.dart' as http;

class UsersService {
  Future<List<User>> getUsers() async {
    final url = Uri.parse("https://api.github.com/users");
    final response = await http.get(url, headers: {'Accept': 'application/vnd.github.v3+json'});
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      List<User> users = list.map((data) => User.fromMap(data)).toList();

      return users;
    }

    return [];
  }
}
