class EmergencyContactModel {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String phoneNumber;

  const EmergencyContactModel({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    required this.phoneNumber,
  });

  // fromJson factory method
  factory EmergencyContactModel.fromJson(Map<String, dynamic> json) {
    return EmergencyContactModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }

  // copyWith method
  EmergencyContactModel copyWith({
    int? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? phoneNumber,
  }) {
    return EmergencyContactModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
