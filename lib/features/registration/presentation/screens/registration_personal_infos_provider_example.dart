import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';
// import 'package:provider/provider.dart'; // ⚠️ DÉCOMMENTER après avoir ajouté provider au pubspec.yaml
// import 'package:form_app/features/registration/data/registration_provider.dart';

/// EXEMPLE D'UTILISATION DE LA MÉTHODE 3 : Provider (State Management)
/// 
/// PRÉREQUIS :
/// 1. Ajouter dans pubspec.yaml sous dependencies:
///    provider: ^6.1.1
/// 
/// 2. Exécuter dans le terminal:
///    flutter pub get
/// 
/// 3. Dans main.dart, wrapper votre app avec ChangeNotifierProvider:
/// 
/// ```dart
/// import 'package:provider/provider.dart';
/// import 'package:form_app/features/registration/data/registration_provider.dart';
/// 
/// void main() {
///   runApp(
///     ChangeNotifierProvider(
///       create: (context) => RegistrationProvider(),
///       child: const Application(),
///     ),
///   );
/// }
/// ```
/// 
/// AVANTAGES :
/// - Pas besoin de passer les données entre les écrans
/// - Données accessibles partout dans l'app
/// - Mises à jour automatiques de l'UI
/// - Code plus propre et maintenable

class RegistrationPersonalInfosProviderExample extends StatefulWidget {
  const RegistrationPersonalInfosProviderExample({super.key});

  @override
  State<RegistrationPersonalInfosProviderExample> createState() =>
      _RegistrationPersonalInfosProviderExampleState();
}

class _RegistrationPersonalInfosProviderExampleState
    extends State<RegistrationPersonalInfosProviderExample> {
  // Controllers pour les champs
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    // ⚠️ DÉCOMMENTER APRÈS AVOIR INSTALLÉ PROVIDER
    // Charger les données existantes depuis le provider
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final provider = context.read<RegistrationProvider>();
    //   fullNameController.text = provider.data.fullName ?? '';
    //   emailController.text = provider.data.email ?? '';
    //   phoneController.text = provider.data.phone ?? '';
    //   dateOfBirthController.text = provider.data.dateOfBirth ?? '';
    // });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    super.dispose();
  }

  // Méthode pour sauvegarder et continuer
  void _saveAndContinue() {
    // ⚠️ DÉCOMMENTER APRÈS AVOIR INSTALLÉ PROVIDER
    // Récupérer le provider (sans écouter les changements)
    // final provider = context.read<RegistrationProvider>();
    
    // Mettre à jour les données dans le provider
    // provider.updatePersonalInfo(
    //   fullName: fullNameController.text,
    //   email: emailController.text,
    //   phone: phoneController.text,
    //   dateOfBirth: dateOfBirthController.text,
    // );

    // Vérifier si les données sont valides
    // if (!provider.isPersonalInfoComplete()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Veuillez remplir tous les champs')),
    //   );
    //   return;
    // }

    // Naviguer vers l'étape suivante (pas besoin de passer les données!)
    // Navigator.pushNamed(context, '/registration/login-info');
    
    // VERSION TEMPORAIRE SANS PROVIDER
    print('Full Name: ${fullNameController.text}');
    print('Email: ${emailController.text}');
    print('Phone: ${phoneController.text}');
    print('Date of Birth: ${dateOfBirthController.text}');
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Installez Provider pour activer cette fonctionnalité'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ⚠️ DÉCOMMENTER APRÈS AVOIR INSTALLÉ PROVIDER
    // Écouter les changements du provider (optionnel sur cet écran)
    // final provider = context.watch<RegistrationProvider>();
    
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // En-tête
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
                ),
                
                SizedBox(height: 10),
                StepsIndicators(count: 6, currentIndex: 0),
                SizedBox(height: 40),

                // Titre
                Text(
                  "Tell us about yourself",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                
                Text(
                  "Please enter your details to create your account.",
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),
                SizedBox(height: 40),

                // Champs de formulaire
                _buildTextField('Full Name', fullNameController, Icons.person),
                SizedBox(height: 20),
                _buildTextField('Email', emailController, Icons.email),
                SizedBox(height: 20),
                _buildTextField('Phone', phoneController, Icons.phone),
                SizedBox(height: 20),
                _buildTextField('Date of Birth', dateOfBirthController, Icons.calendar_today),
                
                SizedBox(height: 40),

                // Bouton pour continuer
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _saveAndContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 16),
                
                // Message d'information
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white70, size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Vos données sont sauvegardées automatiquement',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget helper pour créer un champ de texte stylisé
  Widget _buildTextField(String label, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            prefixIcon: Icon(icon, color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            hintText: 'Enter your $label',
            hintStyle: TextStyle(color: Colors.white38),
          ),
        ),
      ],
    );
  }
}

/// EXEMPLE DE COMMENT ACCÉDER AUX DONNÉES DEPUIS N'IMPORTE QUEL ÉCRAN
/// 
/// Dans n'importe quel écran de votre app, vous pouvez faire :
/// 
/// ```dart
/// // Lire les données sans écouter les changements
/// final provider = context.read<RegistrationProvider>();
/// print(provider.data.fullName);
/// 
/// // Écouter les changements (rebuild quand les données changent)
/// final provider = context.watch<RegistrationProvider>();
/// Text(provider.data.fullName ?? 'Pas de nom');
/// 
/// // Mettre à jour les données
/// context.read<RegistrationProvider>().updateFullName('Jean Dupont');
/// 
/// // Obtenir toutes les données en JSON
/// Map<String, dynamic> json = context.read<RegistrationProvider>().toJson();
/// ```
