import 'package:flutter/material.dart';
import 'package:his_mobile/core/data/datasources/locally/user_data.dart';
import 'package:his_mobile/features/auth/data/models/auth_model.dart';

class UserProvider extends ChangeNotifier {
  final UserData _userData;

  AuthModel? _user;

  AuthModel? get user => _user;

  bool get isLoggedIn => _user != null;

  UserProvider(this._userData) {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _user = _userData.getUser();
    notifyListeners();
  }

  Future<void> login(AuthModel user) async {
    await _userData.saveUser(user);
    _user = user;
    notifyListeners();
  }

  Future<void> logout() async {
    await _userData.clearUser();
    _user = null;
    notifyListeners();
  }
}
