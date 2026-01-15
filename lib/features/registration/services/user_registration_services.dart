import 'package:form_app/features/registration/data/registration_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRegistrationServices {
  Future<bool> saveFormData(RegistrationModel registrationModel) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('fullName', registrationModel.fullname);
    await prefs.setString('emailAddress', registrationModel.emailAddress);
    await prefs.setString('phoneNumber', registrationModel.phoneNumber);
    await prefs.setString('dateOfBirth', registrationModel.dateOfBirth);
    await prefs.setString('username', registrationModel.username);
    await prefs.setString('password', registrationModel.password);

    return true;
  }

  Future<RegistrationModel> loadPreviousFormData() async {
    RegistrationModel model = RegistrationModel(
      fullname: "",
      emailAddress: "",
      phoneNumber: "",
      dateOfBirth: "",
      username: "",
      password: "",
    );

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? fullName = prefs.getString('fullName');
    final String? emailAddress = prefs.getString('emailAddress');
    final String? phoneNumber = prefs.getString('phoneNumber');
    final String? dateOfBirth = prefs.getString('dateOfBirth');
    final String? username = prefs.getString('username');
    final String? password = prefs.getString('password');

    model = model.copyWith(
      fullname: fullName,
      emailAddress: emailAddress,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      username: username,
      password: password,
    );

    return model;
  }
}
