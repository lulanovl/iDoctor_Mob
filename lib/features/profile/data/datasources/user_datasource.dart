import 'package:dio/dio.dart';
import 'package:his_mobile/core/di/service_locator.dart';
import 'package:his_mobile/core/data/datasources/locally/user_data.dart';
import 'package:his_mobile/features/profile/data/models/user_model.dart';

abstract class UserDataSource {
  Future<User> getUserDetails();

  Future<User> updateUserDetails({
    required User user,
  });
}

class UserDataSourceImpl implements UserDataSource {
  final Dio dio;

  UserDataSourceImpl(this.dio);

  @override
  Future<User> getUserDetails() async {
    try {
      final userData = sl<UserData>().getUser();
      if (userData == null) {
        throw Exception('No user data found locally');
      }

      final response = await dio.get(
        'patient/patient-detail/${userData.id}',
      );

      if (response.statusCode == 200 && response.data != null) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Failed to load user details: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception('Dio error: ${dioError.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  @override
  Future<User> updateUserDetails({
    required User user,
  }) async {
    try {
      print('Updating user details: ${user.toJson()}');
      final response = await dio.patch(
        'patient/patient-detail/${user.id}',
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to update user details: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception('Dio error: ${dioError.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
