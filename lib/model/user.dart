import 'dart:convert';

class User {
  final int id;
  final String login;
  final String? name;
  final String? email;
  final String avatarUrl;
  final String? company;
  final int followers;
  final int following;
  final String createdAt;
  User({
    required this.id,
    required this.login,
    this.name,
    this.email,
    required this.avatarUrl,
    this.company,
    required this.followers,
    required this.following,
    required this.createdAt,
  });

  User copyWith({
    int? id,
    String? login,
    String? name,
    String? email,
    String? avatarUrl,
    String? company,
    int? followers,
    int? following,
    String? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      company: company ?? this.company,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'company': company,
      'followers': followers,
      'following': following,
      'createdAt': createdAt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      login: map['login'] ?? '',
      name: map['name'],
      email: map['email'],
      avatarUrl: map['avatar_url'] ?? '',
      company: map['company'],
      followers: map['followers']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, login: $login, name: $name, email: $email, avatarUrl: $avatarUrl, company: $company, followers: $followers, following: $following, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.login == login &&
      other.name == name &&
      other.email == email &&
      other.avatarUrl == avatarUrl &&
      other.company == company &&
      other.followers == followers &&
      other.following == following &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      login.hashCode ^
      name.hashCode ^
      email.hashCode ^
      avatarUrl.hashCode ^
      company.hashCode ^
      followers.hashCode ^
      following.hashCode ^
      createdAt.hashCode;
  }
}
