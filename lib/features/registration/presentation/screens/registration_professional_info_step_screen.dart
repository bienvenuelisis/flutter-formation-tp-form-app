import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

/// Écran permettant à l'utilisateur de saisir ses informations professionnelles
/// Cet écran fait partie du processus d'inscription et représente l'étape 4/6
/// Il collecte la profession, le nom de l'entreprise, les années d'expérience et le secteur d'activité
class RegistrationProfessionalInfoStepScreen extends StatefulWidget {
  const RegistrationProfessionalInfoStepScreen({super.key});

  @override
  State<RegistrationProfessionalInfoStepScreen> createState() =>
      _RegistrationProfessionalInfoStepScreenState();
}

class _RegistrationProfessionalInfoStepScreenState
    extends State<RegistrationProfessionalInfoStepScreen> {
  // ===== CONTRÔLEURS DE TEXTE =====
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController companyController = TextEditingController();

  // ===== LISTES DE CHOIX =====
  // Liste des années d'expérience possibles
  final List<String> experienceYears = [
    '0-1 years',
    '1-3 years',
    '3-5 years',
    '5-10 years',
    '10+ years',
  ];

  // Liste des secteurs d'activité
  // Alternative: charger depuis une base de données, utiliser une API
  final List<String> industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Manufacturing',
    'Retail',
    'Hospitality',
    'Real Estate',
    'Marketing',
    'Other',
  ];

  // Variables pour stocker les sélections
  String? selectedExperience;
  String? selectedIndustry;

  // ===== STATUT D'EMPLOI =====
  // Enum serait mieux mais String est plus simple pour les débutants
  // Les options possibles: 'employed', 'self-employed', 'unemployed', 'student'
  String employmentStatus = 'employed';

  @override
  void dispose() {
    occupationController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== EN-TÊTE =====
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

                // Étape 4/6 (index 3)
                StepsIndicators(count: 6, currentIndex: 3),

                SizedBox(height: 40),

                Text(
                  "Professional information",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  "Tell us about your professional background and current occupation.",
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),

                SizedBox(height: 40),

                // ===== STATUT D'EMPLOI (RADIO BUTTONS) =====
                Text(
                  "Employment Status",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),

                // ===== CONTAINER POUR LES RADIO BUTTONS =====
                // Container avec bordure pour regrouper visuellement les options
                // Alternative: Card, ListTile
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white30, width: 1),
                  ),
                  child: Column(
                    children: [
                      // ===== RADIO LIST TILE =====
                      // Widget combinant un RadioButton avec du texte et une icône
                      // Alternative: Row avec Radio + Text séparés
                      RadioListTile<String>(
                        title: Text(
                          'Employed',
                          style: TextStyle(color: Colors.white70),
                        ),
                        value: 'employed',
                        groupValue: employmentStatus,
                        // ===== ACTIVE COLOR =====
                        // Couleur du radio button quand il est sélectionné
                        activeColor: AppColors.accentColor,
                        onChanged: (String? value) {
                          setState(() {
                            employmentStatus = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text(
                          'Self-employed',
                          style: TextStyle(color: Colors.white70),
                        ),
                        value: 'self-employed',
                        groupValue: employmentStatus,
                        activeColor: AppColors.accentColor,
                        onChanged: (String? value) {
                          setState(() {
                            employmentStatus = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text(
                          'Unemployed',
                          style: TextStyle(color: Colors.white70),
                        ),
                        value: 'unemployed',
                        groupValue: employmentStatus,
                        activeColor: AppColors.accentColor,
                        onChanged: (String? value) {
                          setState(() {
                            employmentStatus = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text(
                          'Student',
                          style: TextStyle(color: Colors.white70),
                        ),
                        value: 'student',
                        groupValue: employmentStatus,
                        activeColor: AppColors.accentColor,
                        onChanged: (String? value) {
                          setState(() {
                            employmentStatus = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // ===== CHAMP PROFESSION =====
                Text(
                  "Occupation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: occupationController,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "e.g., Software Developer",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(Icons.work_outline, color: Colors.white54),
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

                // ===== CHAMP NOM D'ENTREPRISE =====
                Text(
                  "Company Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: companyController,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "e.g., Google Inc.",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.business_outlined,
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

                // ===== ANNÉES D'EXPÉRIENCE (DROPDOWN) =====
                Text(
                  "Years of Experience",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: selectedExperience,
                  decoration: InputDecoration(
                    hintText: "Select experience level",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.timeline_outlined,
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
                  dropdownColor: AppColors.primaryColor,
                  style: TextStyle(color: Colors.white70),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white54),
                  items: experienceYears.map((String experience) {
                    return DropdownMenuItem<String>(
                      value: experience,
                      child: Text(experience),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedExperience = newValue;
                    });
                  },
                ),

                SizedBox(height: 24),

                // ===== SECTEUR D'ACTIVITÉ (DROPDOWN) =====
                Text(
                  "Industry",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: selectedIndustry,
                  decoration: InputDecoration(
                    hintText: "Select your industry",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.domain_outlined,
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
                  dropdownColor: AppColors.primaryColor,
                  style: TextStyle(color: Colors.white70),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white54),
                  items: industries.map((String industry) {
                    return DropdownMenuItem<String>(
                      value: industry,
                      child: Text(industry),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedIndustry = newValue;
                    });
                  },
                ),

                SizedBox(height: 40),

                // ===== BOUTONS DE NAVIGATION =====
                Row(
                  spacing: 16,
                  children: [
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back, size: 20),
                            SizedBox(width: 8),
                            Text("Previous", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // ===== VALIDATION SUGGÉRÉE =====
                          // Vérifier les champs requis:
                          // if (occupationController.text.isEmpty) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Veuillez entrer votre profession'))
                          //   );
                          //   return;
                          // }
                          // Navigator.pushNamed(context, '/email-verification-step');
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
