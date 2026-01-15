import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/core/navigation/utils.dart';
import 'package:form_app/features/registration/data/registration_model.dart';
import 'package:form_app/features/registration/presentation/screens/registration_login_info_step_screen.dart';
import 'package:form_app/features/registration/services/user_registration_services.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

class RegistrationPersonalInfosStepScreen extends StatefulWidget {
  const RegistrationPersonalInfosStepScreen({
    required this.registrationData,
    super.key,
  });

  final RegistrationModel registrationData;

  @override
  State<RegistrationPersonalInfosStepScreen> createState() =>
      _RegistrationPersonalInfosStepScreenState();
}

class _RegistrationPersonalInfosStepScreenState
    extends State<RegistrationPersonalInfosStepScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Controllers to manage text input
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when widget is disposed
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    fullNameController.text = widget.registrationData.fullname;
    emailController.text = widget.registrationData.emailAddress;
    phoneController.text = widget.registrationData.phoneNumber;
    dateOfBirthController.text = widget.registrationData.dateOfBirth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top section with back button and progress indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  StepsIndicators(count: 6, currentIndex: 0),

                  SizedBox(height: 40),

                  // Title
                  Text(
                    "Tell us about yourself",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12),

                  // Subtitle
                  Text(
                    "Please enter your details to create your account.",
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),

                  SizedBox(height: 40),

                  // Full Name field
                  Text(
                    "Full Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Renseignez votre nom complet.";
                      }

                      return null;
                    },
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: "John Doe",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Email Address field
                  Text(
                    "Email Address",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Renseignez votre email.";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: "john@example.com",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Phone Number field
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Renseignez votre numéro de téléphone.";
                      }

                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white70),

                    decoration: InputDecoration(
                      hintText: "+1 (555) 000-0000",

                      hintStyle: TextStyle(color: Colors.white30),

                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Date of Birth field
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: dateOfBirthController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Renseignez votre date de naissance.";
                      }

                      return null;
                    },
                    readOnly: true,
                    style: TextStyle(color: Colors.white70),
                    decoration: InputDecoration(
                      hintText: "MM/DD/YYYY",
                      hintStyle: TextStyle(color: Colors.white30),
                      prefixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white54,
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white54,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white30, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    onTap: () async {
                      // Show date picker when field is tapped
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (pickedDate != null) {
                        // Format the date as MM/DD/YYYY
                        String formattedDate =
                            "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
                        dateOfBirthController.text = formattedDate;
                      }
                    },
                  ),

                  SizedBox(height: 40),

                  // Bottom buttons
                  Row(
                    spacing: 16,
                    children: [
                      // Back button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: BorderSide(color: Colors.white30, width: 1.5),
                            minimumSize: Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text("Back", style: TextStyle(fontSize: 18)),
                        ),
                      ),

                      // Next Step button
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              RegistrationModel registrationData = widget
                                  .registrationData
                                  .copyWith(
                                    fullname: fullNameController.text,
                                    dateOfBirth: dateOfBirthController.text,
                                    emailAddress: emailController.text,
                                    phoneNumber: phoneController.text,
                                  );

                              UserRegistrationServices().saveFormData(
                                registrationData,
                              );

                              // Handle next step
                              // You can add validation here before proceeding
                              navigateToPage(
                                context,
                                RegistrationLoginInfoStepScreen(
                                  registrationData: registrationData,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: AppColors.accentColor,
                            minimumSize: Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Text("Next Step", style: TextStyle(fontSize: 18)),
                              Icon(Icons.arrow_forward, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
