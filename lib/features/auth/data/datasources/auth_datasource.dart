import 'package:dio/dio.dart';
import 'package:his_mobile/core/constants/constants.dart';
import 'package:his_mobile/features/auth/data/models/auth_model.dart';

abstract class AuthDataSource {
  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio;

  AuthDataSourceImpl(this.dio);

  @override
  Future<AuthModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'user_authentication/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return AuthModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Login failed');
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await dio.post(
        'user_authentication/auth/users/reset_password/',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Change password failed');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dio.post(
        'user_authentication/logout',
      );
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Logout failed');
    }
  }
}
