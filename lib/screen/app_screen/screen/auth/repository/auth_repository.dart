import 'package:cem/core/constants/api_endpoints.dart';
import 'package:cem/core/network/http_service.dart';
import 'package:cem/screen/app_screen/screen/auth/data/login_model.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final HttpService httpService;

  AuthRepository(this.httpService);

  /// Login Method
  Future<LoginModel?> login(String username, String password) async {
    try {
      final response = await httpService.postRequest(
        ApiEndpoints.login,
        LoginModel(username: username, password: password).toJson(),
      );

      return LoginModel.fromJson(response);
    } catch (e) {
      debugPrint('Login failed: $e');
      return null; // Return null in case of error
    }
  }

  /// Register method
  /// 
  // Future<LoginModel?> register(String username, String password,dfsdf) async {
  //   try {
  //     final response = await httpService.postRequest(
  //       ApiEndpoints.register,
  //       LoginModel(username: username, password: password).toJson(),
  //     );

  //     return LoginModel.fromJson(response);
  //   } catch (e) {
  //     debugPrint('Login failed: $e');
  //     return null; // Return null in case of error
  //   }
  // }

}
