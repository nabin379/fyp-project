import 'package:cem/screen/app_screen/screen/auth/data/login_model.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../repository/auth_repository.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  LoginProvider(this.authRepository);

  LoginModel? _user;
  bool _isLoading = false;

  /// Getters
  LoginModel? get user => _user;
  bool get isLoading => _isLoading;

  /// Login Method
  Future<void> loginUser(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    _user = await authRepository.login(username, password);

    if (_user == null) {
      Fluttertoast.showToast(
          msg: 'Invalid username or password.',
          toastLength: Toast.LENGTH_SHORT);
    }

    _isLoading = false;
    notifyListeners();
  }
}
