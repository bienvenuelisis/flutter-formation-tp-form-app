import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/core/navigation/utils.dart';
import 'package:form_app/features/registration/data/registration_model.dart';
import 'package:form_app/features/registration/presentation/screens/registration_professional_info_step_screen.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

class RegistrationBusinessInfosScreen extends StatefulWidget {
  const RegistrationBusinessInfosScreen({
    super.key,
    required this.registrationData,
  });

  final RegistrationModel registrationData;

  @override
  State<RegistrationBusinessInfosScreen> createState() =>
      _RegistrationBusinessInfosScreenState();
}

class _RegistrationBusinessInfosScreenState
    extends State<RegistrationBusinessInfosScreen> {
  // Controllers to manage text input
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
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

                StepsIndicators(count: 6, currentIndex: 2),

                SizedBox(height: 40),

                // Title
                Text(
                  "Tell us about your business",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12),

                // Subtitle
                Text(
                  "We need a few details to get your profile set up correctly.",
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),

                SizedBox(height: 40),

                // Full Name field
                Text(
                  "Company Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your company name';
                    }
                    return null;
                  },
                  controller: fullNameController,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "e.g. Acme Corp",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.corporate_fare,
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
                  "Business Type",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),

                //liste deroulante
                DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      child: Text("Entreprise individuelle"),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text("Entreprise commerciale"),
                    ),
                  ],
                  onChanged: (value) {},

                  decoration: InputDecoration(
                    hintText: "Select Business Type",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(Icons.widgets, color: Colors.white54),
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
                  "Business Address",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  controller: dateOfBirthController,
                  readOnly: true,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "Street Address",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(Icons.location_on, color: Colors.white54),
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

                Spacer(),

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
                          // Handle next step
                          // You can add validation here before proceeding
                          bool isValid =
                              formKey.currentState?.validate() ?? false;

                          if (isValid) {
                            navigateToPage(
                              context,
                              RegistrationProfessionalInfoStepScreen(),
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
    );
  }
}
