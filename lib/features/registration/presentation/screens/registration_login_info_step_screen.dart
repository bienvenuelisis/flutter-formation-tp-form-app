import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

/// Écran permettant à l'utilisateur de créer ses identifiants de connexion
/// Cet écran fait partie du processus d'inscription et représente l'étape 2/6
/// Il collecte le nom d'utilisateur, le mot de passe et sa confirmation
class RegistrationLoginInfoStepScreen extends StatefulWidget {
  const RegistrationLoginInfoStepScreen({super.key});

  @override
  State<RegistrationLoginInfoStepScreen> createState() =>
      _RegistrationLoginInfoStepScreenState();
}

class _RegistrationLoginInfoStepScreenState
    extends State<RegistrationLoginInfoStepScreen> {
  
  // ===== CONTRÔLEURS DE TEXTE =====
  // Les TextEditingController permettent de gérer le contenu des champs de texte
  // Ils permettent de lire, modifier et écouter les changements de texte
  // Alternative: utiliser des packages de gestion d'état comme Riverpod ou Bloc
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // ===== VARIABLES D'ÉTAT POUR LA VISIBILITÉ DES MOTS DE PASSE =====
  // Ces booléens contrôlent si les mots de passe sont visibles ou masqués
  // false = masqué (par défaut pour la sécurité), true = visible
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    // ===== NETTOYAGE DES RESSOURCES =====
    // TRÈS IMPORTANT: toujours libérer les contrôleurs pour éviter les fuites mémoire
    // dispose() est appelé automatiquement quand le widget est détruit
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ===== SCAFFOLD =====
    // Scaffold est la structure de base d'un écran Flutter
    // Il fournit des emplacements pour AppBar, Body, FloatingActionButton, etc.
    // Alternative: utiliser directement Container mais Scaffold offre plus de fonctionnalités
    return Scaffold(
      // Couleur de fond de tout l'écran
      backgroundColor: AppColors.primaryColor,
      
      // ===== SAFE AREA =====
      // SafeArea évite que le contenu ne soit masqué par les encoches,
      // la barre de statut ou les boutons de navigation système
      // Très important pour les appareils modernes (iPhone avec encoche, etc.)
      body: SafeArea(
        child: Padding(
          // ===== PADDING =====
          // Ajoute un espacement intérieur de 16 pixels sur tous les côtés
          // Alternative: utiliser EdgeInsets.symmetric() pour des valeurs différentes
          padding: const EdgeInsets.all(16.0),
          
          child: SingleChildScrollView(
            // ===== SINGLE CHILD SCROLL VIEW =====
            // Rend le contenu scrollable si la taille de l'écran est insuffisante
            // Essentiel pour éviter les débordements sur petits écrans ou quand le clavier apparaît
            // Alternative: ListView (mais moins adapté pour un contenu fixe)
            
            child: Column(
              // ===== COLUMN =====
              // Organise les widgets verticalement (les uns en dessous des autres)
              // Alternative: ListView pour du contenu dynamique, Stack pour superposer
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // ===== SECTION HAUT: BOUTON RETOUR =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ===== ICON BUTTON =====
                    // Bouton avec juste une icône, souvent utilisé pour la navigation
                    // Alternative: TextButton, ElevatedButton avec child Icon
                    IconButton(
                      onPressed: () {
                        // Navigator.pop() retourne à l'écran précédent
                        // Alternative: utiliser un système de navigation nommé
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

                // ===== INDICATEURS DE PROGRESSION =====
                // Widget personnalisé qui affiche l'avancement dans le processus d'inscription
                // count: nombre total d'étapes (6)
                // currentIndex: étape actuelle (1 car on commence à 0, donc 0=étape 1, 1=étape 2)
                StepsIndicators(count: 6, currentIndex: 1),

                SizedBox(height: 40),

                // ===== TITRE PRINCIPAL =====
                // Text est le widget de base pour afficher du texte
                // TextStyle permet de personnaliser l'apparence (couleur, taille, poids)
                Text(
                  "Secure your account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold, // Gras pour l'emphase
                  ),
                ),

                SizedBox(height: 12),

                // ===== SOUS-TITRE DESCRIPTIF =====
                // Explique à l'utilisateur ce qu'il doit faire
                // Colors.white60 = blanc avec 60% d'opacité pour un effet secondaire
                Text(
                  "Create a unique username and a strong password to protect your data.",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 40),

                // ===== CHAMP USERNAME =====
                // Label du champ
                Text(
                  "Username",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                
                // ===== TEXT FIELD =====
                // Widget interactif permettant la saisie de texte
                // Alternative: TextFormField (avec validation intégrée), CupertinoTextField (style iOS)
                TextField(
                  controller: usernameController, // Lie le contrôleur au champ
                  style: TextStyle(color: Colors.white70), // Style du texte saisi
                  
                  // ===== INPUT DECORATION =====
                  // Permet de personnaliser l'apparence complète du champ de texte
                  decoration: InputDecoration(
                    hintText: "e.g., john_doe", // Texte d'aide qui disparaît à la saisie
                    hintStyle: TextStyle(color: Colors.white30),
                    
                    // ===== PREFIX ICON =====
                    // Icône à gauche du champ pour indiquer visuellement le type de données
                    // Alternative: prefixText (texte au lieu d'icône)
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.white54,
                    ),
                    
                    // Fond légèrement transparent pour le champ
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    
                    // ===== BORDURES =====
                    // border: bordure par défaut
                    // enabledBorder: quand le champ n'est pas actif
                    // focusedBorder: quand le champ est sélectionné
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Bords arrondis
                      borderSide: BorderSide(color: Colors.white30, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white30, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.greenAccent, // Vert quand actif
                        width: 2,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // ===== CHAMP MOT DE PASSE =====
                Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                
                TextField(
                  controller: passwordController,
                  
                  // ===== OBSCURE TEXT =====
                  // Masque le texte saisi (affiche des points au lieu des caractères)
                  // La valeur change selon l'état de isPasswordVisible
                  // !isPasswordVisible signifie "l'inverse de isPasswordVisible"
                  obscureText: !isPasswordVisible,
                  
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "••••••••", // Points pour simuler un mot de passe
                    hintStyle: TextStyle(color: Colors.white30),
                    
                    prefixIcon: Icon(
                      Icons.lock_outline, // Icône de cadenas
                      color: Colors.white54,
                    ),
                    
                    // ===== SUFFIX ICON =====
                    // IconButton à droite du champ pour basculer la visibilité
                    // Alternative: suffix (widget personnalisé au lieu d'icône)
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Change l'icône selon l'état de visibilité
                        isPasswordVisible 
                            ? Icons.visibility 
                            : Icons.visibility_off,
                        color: Colors.white54,
                      ),
                      onPressed: () {
                        // ===== SET STATE =====
                        // CRUCIAL: setState() indique à Flutter de redessiner le widget
                        // Sans setState(), le changement de variable ne s'affiche pas
                        // Alternative: utiliser des packages de state management (Provider, Riverpod, Bloc)
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
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

                SizedBox(height: 8),

                // ===== INDICATION DE VALIDATION =====
                // Row pour aligner horizontalement l'icône et le texte
                Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.white54,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Must be at least 8 characters",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24),

                // ===== CHAMP CONFIRMATION MOT DE PASSE =====
                // Structure similaire au champ Password ci-dessus
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                
                TextField(
                  controller: confirmPasswordController,
                  obscureText: !isConfirmPasswordVisible,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    hintStyle: TextStyle(color: Colors.white30),
                    
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white54,
                    ),
                    
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible 
                            ? Icons.visibility 
                            : Icons.visibility_off,
                        color: Colors.white54,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
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

                SizedBox(height: 40),

                // ===== SECTION BOUTONS DE NAVIGATION =====
                // Row avec spacing pour espacer automatiquement les boutons
                Row(
                  spacing: 16, // Espacement automatique entre les enfants
                  children: [
                    
                    // ===== BOUTON "PREVIOUS" =====
                    // Expanded fait que le widget prend tout l'espace disponible
                    // flex: 1 (par défaut) = prend 1 part de l'espace
                    Expanded(
                      child: OutlinedButton(
                        // ===== OUTLINED BUTTON =====
                        // Bouton avec bordure sans fond plein
                        // Alternative: TextButton (sans bordure), ElevatedButton (avec fond)
                        onPressed: () {
                          Navigator.pop(context); // Retour à l'étape précédente
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white, // Couleur du texte
                          side: BorderSide(
                            color: Colors.white30,
                            width: 1.5,
                          ),
                          minimumSize: Size(double.infinity, 56), // Hauteur minimale
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back, size: 20),
                            SizedBox(width: 8),
                            Text(
                              "Previous",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ===== BOUTON "NEXT STEP" =====
                    Expanded(
                      flex: 2, // Prend 2 parts de l'espace (2x plus large que Previous)
                      child: ElevatedButton(
                        // ===== ELEVATED BUTTON =====
                        // Bouton avec fond plein et ombre
                        // C'est le bouton principal (Call-to-Action)
                        // Alternative: FilledButton (Material 3)
                        onPressed: () {
                          // ===== VALIDATION À IMPLÉMENTER =====
                          // Ici vous devriez vérifier:
                          // 1. Que le username n'est pas vide
                          // 2. Que le mot de passe fait au moins 8 caractères
                          // 3. Que les deux mots de passe correspondent
                          // Exemple:
                          // if (passwordController.text.length < 8) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text('Le mot de passe doit faire au moins 8 caractères'))
                          //   );
                          //   return;
                          // }
                          // Navigator.pushNamed(context, '/next-step');
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: AppColors.accentColor, // Couleur de fond
                          minimumSize: Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              "Next Step",
                              style: TextStyle(fontSize: 18),
                            ),
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
