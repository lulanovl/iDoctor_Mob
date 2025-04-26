import 'package:his_mobile/features/profile/data/models/address_model.dart';
import 'package:his_mobile/features/profile/data/models/emergency_contact_model.dart';

class User {
  final int id;
  final String userId;
  final String firstName;
  final String lastName;
  final String? middleName;
  final String email;
  final String citizenship;
  final String? dateOfBirth;
  final String phoneNumber;
  final String? gender;
  final Address address;
  final EmergencyContactModel primaryEmergencyContact;
  final EmergencyContactModel? secondaryEmergencyContact;
  final String? maritalStatus;
  final String? bloodGroup;
  final String? vision;
  final List<String>? allergies;
  final List<String>? vaccines; // Fixed typo from "vaccenes" to "vaccines"

  const User({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    this.middleName,
    required this.email,
    required this.citizenship,
    this.dateOfBirth,
    required this.phoneNumber,
    this.gender,
    required this.address,
    required this.primaryEmergencyContact,
    this.secondaryEmergencyContact,
    this.maritalStatus,
    this.bloodGroup,
    this.vision,
    this.allergies,
    this.vaccines,
  });

  // fromJson factory method
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      middleName: json['middle_name'] as String?,
      email: json['email'] as String,
      citizenship: json['citizenship'] as String,
      dateOfBirth: json['date_of_birth'] as String?,
      phoneNumber: json['phone_number'] as String,
      gender: json['gender'] as String?,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      primaryEmergencyContact: EmergencyContactModel.fromJson(
        json['primary_emergency_contact'] as Map<String, dynamic>,
      ),
      secondaryEmergencyContact: json['secondary_emergency_contact'] != null
          ? EmergencyContactModel.fromJson(
              json['secondary_emergency_contact'] as Map<String, dynamic>,
            )
          : null,
      maritalStatus: json['marital_status'] as String?,
      bloodGroup: json['blood_group'] as String?,
      vision: json['vision'] as String?,
      allergies: (json['allergies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vaccines: (json['vaccines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'middle_name': middleName,
      'email': email,
      'citizenship': citizenship,
      'date_of_birth': dateOfBirth,
      'phone_number': phoneNumber,
      'gender': gender,
      'address': address.toJson(),
      'primary_emergency_contact': primaryEmergencyContact.toJson(),
      'secondary_emergency_contact':
          secondaryEmergencyContact?.toJson(), // Handle nullable
      'marital_status': maritalStatus,
      'blood_group': bloodGroup,
      'vision': vision,
      'allergies': allergies,
      'vaccines': vaccines,
    };
  }

  // copyWith method
  User copyWith({
    int? id,
    String? userId,
    String? firstName,
    String? lastName,
    String? middleName,
    String? email,
    String? citizenship,
    String? dateOfBirth,
    String? phoneNumber,
    String? gender,
    Address? address,
    EmergencyContactModel? primaryEmergencyContact,
    EmergencyContactModel? secondaryEmergencyContact,
    String? maritalStatus,
    String? bloodGroup,
    String? vision,
    List<String>? allergies,
    List<String>? vaccines,
  }) {
    return User(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      email: email ?? this.email,
      citizenship: citizenship ?? this.citizenship,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      primaryEmergencyContact:
          primaryEmergencyContact ?? this.primaryEmergencyContact,
      secondaryEmergencyContact:
          secondaryEmergencyContact ?? this.secondaryEmergencyContact,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      vision: vision ?? this.vision,
      allergies: allergies ?? this.allergies,
      vaccines: vaccines ?? this.vaccines,
    );
  }
}
