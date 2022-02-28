class UserModel {
  final int id;
  final String login;
  final String name;
  final String email;
  final String avatarUrl;
  final String company;
  final int followers;
  final int following;
  final String createdAt;

  UserModel({
    required this.id,
    required this.login,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.company,
    required this.followers,
    required this.following,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] ?? 0,
      login: json['login'] ?? '',
      avatarUrl: json['avatar_url'] ?? '',
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      createdAt: json['created_at'] ?? '',
      company: json['company'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? ''
      );

  static List<UserModel> listFromJson(list) => List<UserModel>.from(list.map((h) => UserModel.fromJson(h)));
}
