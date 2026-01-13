// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegistrationModel {
  final String fullname;
  final String emailAddress;
  final String phoneNumber;
  final String dateOfBirth;
  final String username;
  final String password;

  RegistrationModel({
    required this.fullname,
    required this.emailAddress,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.username,
    required this.password,
  });

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
}
