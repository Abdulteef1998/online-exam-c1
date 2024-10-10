import 'package:online_exam_c1_online/domain/app_user.dart';

class User {
  User({
    this.name,
    this.email,
    this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  AppUser? toAppUser() {
    return AppUser.fromData(
      firstName: name,
      email: email,
    );
  }

}