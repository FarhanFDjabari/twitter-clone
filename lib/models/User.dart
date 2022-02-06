import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? password;
  final String? name;
  final String? username;
  final String? token;

  User({
    required this.email,
    required this.password,
    required this.name,
    required this.username,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        name = json['name'],
        username = json['handle'],
        token = json['token'];

  @override
  List<Object?> get props => [email, password, name, username, token];
}
