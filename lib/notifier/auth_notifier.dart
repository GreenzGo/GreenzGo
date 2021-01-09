import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//creates the AuthNotifier class
class AuthNotifier with ChangeNotifier {
  User _user;
  User get user => _user;

//creates the setUser function
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
