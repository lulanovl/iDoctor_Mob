class AuthModel {
  final String token;
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String middleName;

  const AuthModel({
    required this.token,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.middleName,
  });

  // fromJson factory method
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'] as String,
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      middleName: json['middle_name'] as String,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'middle_name': middleName,
    };
  }

  // copyWith method
  AuthModel copyWith({
    String? token,
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
  }) {
    return AuthModel(
      token: token ?? this.token,
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
    );
  }
}
