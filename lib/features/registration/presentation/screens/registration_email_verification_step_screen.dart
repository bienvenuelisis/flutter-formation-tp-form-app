import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/core/navigation/utils.dart';
import 'package:form_app/features/registration/presentation/screens/registration_success_screen.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

/// Écran de vérification d'email
/// Cet écran fait partie du processus d'inscription et représente l'étape 5/6
/// Il permet à l'utilisateur de saisir un code de vérification envoyé par email
class RegistrationEmailVerificationStepScreen extends StatefulWidget {
  const RegistrationEmailVerificationStepScreen({super.key});

  @override
  State<RegistrationEmailVerificationStepScreen> createState() =>
      _RegistrationEmailVerificationStepScreenState();
}

class _RegistrationEmailVerificationStepScreenState
    extends State<RegistrationEmailVerificationStepScreen> {
  // ===== CONTRÔLEURS POUR CHAQUE CHIFFRE DU CODE =====
  // Un code de vérification typique contient 6 chiffres
  // Chaque chiffre a son propre contrôleur pour un contrôle précis
  final TextEditingController digit1Controller = TextEditingController();
  final TextEditingController digit2Controller = TextEditingController();
  final TextEditingController digit3Controller = TextEditingController();
  final TextEditingController digit4Controller = TextEditingController();
  final TextEditingController digit5Controller = TextEditingController();
  final TextEditingController digit6Controller = TextEditingController();

  // ===== FOCUS NODES =====
  // FocusNode contrôle quel champ a le focus (est actif/sélectionné)
  // Permet de passer automatiquement au champ suivant après avoir saisi un chiffre
  // Alternative: utiliser un package comme pin_code_fields
  final FocusNode digit1Focus = FocusNode();
  final FocusNode digit2Focus = FocusNode();
  final FocusNode digit3Focus = FocusNode();
  final FocusNode digit4Focus = FocusNode();
  final FocusNode digit5Focus = FocusNode();
  final FocusNode digit6Focus = FocusNode();

  // ===== TIMER POUR LE COMPTE À REBOURS =====
  // Timer permet d'exécuter une action répétée dans le temps
  // Utilisé pour le compte à rebours avant de pouvoir renvoyer le code
  Timer? _timer;
  int _remainingSeconds = 60; // 60 secondes avant de pouvoir renvoyer
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    // ===== INIT STATE =====
    // Méthode appelée UNE SEULE FOIS quand le widget est créé
    // Parfait pour initialiser des données, démarrer des timers, etc.
    // Alternative: late final avec initialisation immédiate
    _startTimer();
  }

  // ===== MÉTHODE POUR DÉMARRER LE TIMER =====
  void _startTimer() {
    _canResend = false;
    _remainingSeconds = 60;

    // ===== TIMER.PERIODIC =====
    // Crée un timer qui s'exécute toutes les secondes
    // Duration(seconds: 1) = intervalle de répétition
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _canResend = true;
          timer.cancel(); // Arrête le timer quand le compte à rebours atteint 0
        }
      });
    });
  }

  @override
  void dispose() {
    // Annule le timer pour éviter les fuites mémoire
    _timer?.cancel();

    // Libère tous les contrôleurs
    digit1Controller.dispose();
    digit2Controller.dispose();
    digit3Controller.dispose();
    digit4Controller.dispose();
    digit5Controller.dispose();
    digit6Controller.dispose();

    // Libère tous les focus nodes
    digit1Focus.dispose();
    digit2Focus.dispose();
    digit3Focus.dispose();
    digit4Focus.dispose();
    digit5Focus.dispose();
    digit6Focus.dispose();

    super.dispose();
  }

  // ===== MÉTHODE POUR CONSTRUIRE UN CHAMP DE CODE =====
  // Widget réutilisable pour chaque chiffre du code
  // Évite la duplication de code en créant une fonction personnalisée
  Widget _buildCodeDigitField({
    required TextEditingController controller,
    required FocusNode currentFocus,
    FocusNode? nextFocus, // Optional: peut être null pour le dernier champ
  }) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        // ===== TEXT ALIGN CENTER =====
        // Centre le chiffre dans le champ pour un meilleur visuel
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        // ===== KEYBOARD TYPE NUMBER =====
        // Affiche uniquement le clavier numérique
        keyboardType: TextInputType.number,
        // ===== MAX LENGTH =====
        // Limite à 1 caractère par champ
        maxLength: 1,
        decoration: InputDecoration(
          // counterText: "" cache le compteur "0/1" sous le champ
          counterText: "",
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white30, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white30, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.accentColor, width: 2),
          ),
        ),
        // ===== ON CHANGED =====
        // Callback appelé à chaque modification du texte
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            // ===== REQUEST FOCUS =====
            // Déplace le focus (curseur) vers le champ suivant
            // Crée une expérience utilisateur fluide
            nextFocus.requestFocus();
          }
          // Si l'utilisateur efface, retourne au champ précédent
          if (value.isEmpty && currentFocus != digit1Focus) {
            // On ne peut pas facilement retourner en arrière sans une logique complexe
            // C'est une limitation de cette approche simple
          }
        },
      ),
    );
  }

  // ===== MÉTHODE POUR VÉRIFIER LE CODE =====
  void _verifyCode() {
    // Récupère tous les chiffres et les concatène
    String code =
        digit1Controller.text +
        digit2Controller.text +
        digit3Controller.text +
        digit4Controller.text +
        digit5Controller.text +
        digit6Controller.text;

    // Vérification simple
    if (code.length != 6) {
      // ===== SCAFFOLD MESSENGER =====
      // Service Flutter pour afficher des messages temporaires (SnackBar)
      // Alternative: showDialog, Toast (package externe)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all 6 digits'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Ici, vous devriez:
    // 1. Envoyer le code à votre API backend
    // 2. Vérifier si le code est correct
    // 3. Si correct, passer à l'étape suivante
    // Exemple:
    // final response = await api.verifyCode(code);
    // if (response.success) {
    //   Navigator.pushNamed(context, '/success-step');
    // }
    navigateToPage(context, RegistrationSuccessScreen());
  }

  // ===== MÉTHODE POUR RENVOYER LE CODE =====
  void _resendCode() {
    if (!_canResend) return;

    // Ici, vous devriez appeler votre API pour renvoyer le code
    // Exemple: await api.resendVerificationCode();

    // Redémarre le timer
    _startTimer();

    // Affiche une confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Verification code sent!'),
        backgroundColor: Colors.green,
      ),
    );
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

                // Étape 5/6 (index 4)
                StepsIndicators(count: 6, currentIndex: 4),

                SizedBox(height: 40),

                // ===== ICÔNE EMAIL CENTRÉE =====
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.accentColor.withOpacity(0.2),
                      shape: BoxShape.circle, // Forme circulaire
                    ),
                    child: Icon(
                      Icons.email_outlined,
                      size: 50,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                Text(
                  "Verify your email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 12),

                // ===== RICH TEXT =====
                // Permet de styliser différemment des parties d'un même texte
                // Alternative: plusieurs widgets Text séparés
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                    children: [
                      TextSpan(text: "We've sent a verification code to\n"),
                      TextSpan(
                        text: "john@example.com", // Devrait être dynamique
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Text(
                  "Enter verification code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 16),

                // ===== CHAMPS DE CODE EN LIGNE =====
                // Row pour aligner horizontalement les 6 champs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCodeDigitField(
                      controller: digit1Controller,
                      currentFocus: digit1Focus,
                      nextFocus: digit2Focus,
                    ),
                    _buildCodeDigitField(
                      controller: digit2Controller,
                      currentFocus: digit2Focus,
                      nextFocus: digit3Focus,
                    ),
                    _buildCodeDigitField(
                      controller: digit3Controller,
                      currentFocus: digit3Focus,
                      nextFocus: digit4Focus,
                    ),
                    _buildCodeDigitField(
                      controller: digit4Controller,
                      currentFocus: digit4Focus,
                      nextFocus: digit5Focus,
                    ),
                    _buildCodeDigitField(
                      controller: digit5Controller,
                      currentFocus: digit5Focus,
                      nextFocus: digit6Focus,
                    ),
                    _buildCodeDigitField(
                      controller: digit6Controller,
                      currentFocus: digit6Focus,
                      nextFocus: null, // Dernier champ, pas de suivant
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // ===== LIEN POUR RENVOYER LE CODE =====
                // Center pour centrer horizontalement
                Center(
                  child: _canResend
                      ? TextButton(
                          // ===== TEXT BUTTON =====
                          // Bouton style texte sans bordure ni fond
                          // Parfait pour les actions secondaires
                          onPressed: _resendCode,
                          child: Text(
                            "Resend Code",
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Text(
                          // ===== INTERPOLATION DE STRING =====
                          // $variable insère la valeur dans le texte
                          "Resend code in $_remainingSeconds seconds",
                          style: TextStyle(color: Colors.white54, fontSize: 14),
                        ),
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
                        onPressed: _verifyCode,
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
                            Text("Verify", style: TextStyle(fontSize: 18)),
                            Icon(Icons.check_circle_outline, size: 20),
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
