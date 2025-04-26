import 'package:his_mobile/domain/usecases/sign_in_usecase.dart';

class SignInModel extends SignInParams {
  const SignInModel({
    required super.email,
    required super.password,
  });

  // fromJson factory method
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
