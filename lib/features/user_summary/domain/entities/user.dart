import 'package:flutter/material.dart';
import 'package:testing_new_architecture/features/user_summary/data/models/user_model.dart';

class User {
  final String name;
  final String email;

  User({
    @required this.name,
    @required this.email,
  });

  factory User.conveter(UserModel userModel) {
    if (userModel == null) {
      return null;
    }

    return User(name: userModel.name, email: userModel.email);
  }
}
