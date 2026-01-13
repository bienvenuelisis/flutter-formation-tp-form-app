import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/core/navigation/utils.dart';
import 'package:form_app/features/registration/presentation/screens/registration_email_verification_step_screen.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

/// Écran permettant à l'utilisateur de saisir son adresse
/// Cet écran fait partie du processus d'inscription et représente l'étape 3/6
/// Il collecte l'adresse complète, la ville, l'état/province, le code postal et le pays
class RegistrationAddressStepScreen extends StatefulWidget {
  const RegistrationAddressStepScreen({super.key});

  @override
  State<RegistrationAddressStepScreen> createState() =>
      _RegistrationAddressStepScreenState();
}

class _RegistrationAddressStepScreenState
    extends State<RegistrationAddressStepScreen> {
  // ===== CONTRÔLEURS DE TEXTE =====
  // Chaque contrôleur gère un champ de saisie d'adresse différent
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  // ===== LISTE DES PAYS =====
  // Liste prédéfinie de pays pour le menu déroulant
  // Alternative: charger depuis une API, utiliser un package comme country_picker
  final List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'France',
    'Germany',
    'Spain',
    'Italy',
    'Japan',
    'Australia',
    'Other',
  ];

  // Variable pour stocker le pays sélectionné
  String? selectedCountry;

  @override
  void dispose() {
    // Libération de la mémoire pour tous les contrôleurs
    streetAddressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    countryController.dispose();
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
                // ===== EN-TÊTE AVEC BOUTON RETOUR =====
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

                // ===== INDICATEURS D'ÉTAPES =====
                // currentIndex: 2 car c'est la 3ème étape (index commence à 0)
                StepsIndicators(count: 6, currentIndex: 2),

                SizedBox(height: 40),

                // ===== TITRE =====
                Text(
                  "Where do you live?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12),

                // ===== SOUS-TITRE =====
                Text(
                  "We need your address for verification and delivery purposes.",
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                ),

                SizedBox(height: 40),

                // ===== CHAMP ADRESSE DE RUE =====
                Text(
                  "Street Address",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: streetAddressController,
                  style: TextStyle(color: Colors.white70),
                  // ===== KEYBOARD TYPE =====
                  // streetAddress permet un clavier optimisé pour les adresses
                  // Alternative: TextInputType.text (clavier standard)
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: "123 Main Street",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.home_outlined,
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

                // ===== CHAMP VILLE =====
                Text(
                  "City",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: cityController,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "New York",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.location_city_outlined,
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

                // ===== LIGNE AVEC 2 CHAMPS: ÉTAT ET CODE POSTAL =====
                // Row permet d'aligner horizontalement deux champs côte à côte
                Row(
                  children: [
                    // ===== CHAMP ÉTAT/PROVINCE =====
                    // Expanded prend la moitié de l'espace disponible
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "State/Province",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: stateController,
                            style: TextStyle(color: Colors.white70),
                            decoration: InputDecoration(
                              hintText: "NY",
                              hintStyle: TextStyle(color: Colors.white30),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                  width: 1,
                                ),
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
                        ],
                      ),
                    ),

                    SizedBox(width: 16), // Espacement entre les deux champs
                    // ===== CHAMP CODE POSTAL =====
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zip Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: zipCodeController,
                            style: TextStyle(color: Colors.white70),
                            // ===== KEYBOARD TYPE NUMBER =====
                            // Affiche un clavier numérique pour faciliter la saisie
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "10001",
                              hintStyle: TextStyle(color: Colors.white30),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.white30,
                                  width: 1,
                                ),
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
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // ===== CHAMP PAYS (DROPDOWN) =====
                Text(
                  "Country",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),

                // ===== DROPDOWN BUTTON FORM FIELD =====
                // Widget permettant de choisir parmi une liste prédéfinie d'options
                // Alternative: showModalBottomSheet avec ListView, autocomplete TextField
                DropdownButtonFormField<String>(
                  initialValue: selectedCountry,
                  // ===== DECORATION =====
                  // Même style que les TextField pour la cohérence visuelle
                  decoration: InputDecoration(
                    hintText: "Select your country",
                    hintStyle: TextStyle(color: Colors.white30),
                    prefixIcon: Icon(
                      Icons.flag_outlined,
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
                  // ===== STYLE DU DROPDOWN =====
                  dropdownColor: AppColors.primaryColor,
                  style: TextStyle(color: Colors.white70),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white54),
                  // ===== ITEMS =====
                  // .map() transforme chaque String en DropdownMenuItem
                  // .toList() convertit le résultat en List
                  items: countries.map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  // ===== ON CHANGED =====
                  // Callback appelé quand l'utilisateur sélectionne un pays
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountry = newValue;
                    });
                  },
                ),

                SizedBox(height: 40),

                // ===== BOUTONS DE NAVIGATION =====
                Row(
                  spacing: 16,
                  children: [
                    // Bouton Previous
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

                    // Bouton Next Step
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          // ===== VALIDATION SUGGÉRÉE =====
                          // Vérifier que tous les champs requis sont remplis:
                          // if (streetAddressController.text.isEmpty) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Veuillez entrer votre adresse'))
                          //   );
                          //   return;
                          // }
                          // if (selectedCountry == null) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Veuillez sélectionner un pays'))
                          //   );
                          //   return;
                          // }
                          navigateToPage(
                            context,
                            RegistrationEmailVerificationStepScreen(),
                          );
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
