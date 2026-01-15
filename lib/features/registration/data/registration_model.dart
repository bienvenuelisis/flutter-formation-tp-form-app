// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistrationModel {
  RegistrationModel({
    required this.fullname,
    required this.emailAddress,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.username,
    required this.password,
  });

  factory RegistrationModel.fromJson(String json) {
    final map = jsonDecode(json);

    return RegistrationModel.fromMap(map);
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      fullname: map["fullname"],
      emailAddress: map["emailAddress"],
      phoneNumber: map["phoneNumber"],
      dateOfBirth: map["dateOfBirth"],
      username: map["username"],
      password: map["password"],
    );
  }

  final String dateOfBirth;
  final String emailAddress;
  final String fullname;
  final String password;
  final String phoneNumber;
  final String username;

  RegistrationModel copyWith({
    String? fullname,
    String? emailAddress,
    String? phoneNumber,
    String? dateOfBirth,
    String? username,
    String? password,
  }) {
    return RegistrationModel(
      fullname: fullname ?? this.fullname,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  String toJson() {
    Map<String, dynamic> map = toMap();

    final jsonString = jsonEncode(map);

    return jsonString;
  }

  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "emailAddress": emailAddress,
      "phoneNumber": phoneNumber,
      "dateOfBirth": dateOfBirth,
      "username": username,
      "password": password,
    };
  }
}
