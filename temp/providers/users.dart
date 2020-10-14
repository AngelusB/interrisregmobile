import 'dart:convert';
import 'package:flutter/material.dart';


class Users with ChangeNotifier {
  List<User> _users = [];
  final String F_USER_ID;

  Users(this.F_USER_ID, this._users);

  List<User> get users {
    return [..._user];
  }

  User findById(String id) {
    return _users.firstWhere((user) => user.F_PERSON_ID == id);
  }
}

