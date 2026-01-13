import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';

/// Écran de confirmation finale du processus d'inscription
/// Cet écran représente l'étape 6/6 (dernière étape)
/// Il confirme que l'inscription est réussie et offre des options de navigation
class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // ===== CENTER =====
          // Widget qui centre son enfant horizontalement ET verticalement
          // Alternative: Column avec mainAxisAlignment.center
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ===== ANIMATION DE SUCCÈS =====
                // Container avec animation d'échelle pour un effet visuel
                // Alternative: utiliser Lottie animations, AnimatedContainer

                // ===== ICÔNE DE SUCCÈS AVEC CERCLE =====
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    // ===== GRADIENT =====
                    // Crée un dégradé de couleurs pour un effet moderne
                    // LinearGradient: dégradé en ligne droite
                    // Alternative: RadialGradient (circulaire), SweepGradient (rotation)
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accentColor,
                        AppColors.accentColor.withOpacity(0.6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    // ===== BOX SHADOW =====
                    // Ajoute une ombre pour donner de la profondeur
                    // boxShadow accepte une liste pour plusieurs ombres
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentColor.withOpacity(0.3),
                        blurRadius: 20, // Rayon de flou de l'ombre
                        spreadRadius: 5, // Extension de l'ombre
                        offset: Offset(0, 10), // Décalage (x, y)
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 70,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 48),

                // ===== TITRE DE SUCCÈS =====
                Text(
                  "Success!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    // ===== LETTER SPACING =====
                    // Espace entre les lettres pour un style plus aéré
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: 16),

                // ===== MESSAGE DE FÉLICITATIONS =====
                Text(
                  "Your account has been\nsuccessfully created!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    // ===== HEIGHT =====
                    // Espacement entre les lignes (line-height en CSS)
                    // 1.5 = 150% de la taille de la police
                    height: 1.5,
                  ),
                ),

                SizedBox(height: 48),

                // ===== INFORMATIONS DE COMPTE (OPTIONNEL) =====
                // Container avec bordure pour afficher les infos du compte
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      // ===== LIGNE D'INFORMATION =====
                      // Méthode réutilisable pour afficher icône + texte
                      _buildInfoRow(
                        icon: Icons.email_outlined,
                        label: "Email verified",
                        value: "✓",
                      ),
                      SizedBox(height: 16),
                      _buildInfoRow(
                        icon: Icons.person_outline,
                        label: "Profile completed",
                        value: "100%",
                      ),
                      SizedBox(height: 16),
                      _buildInfoRow(
                        icon: Icons.lock_outline,
                        label: "Account secured",
                        value: "✓",
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 48),

                // ===== BOUTON PRINCIPAL - CONTINUER =====
                ElevatedButton(
                  onPressed: () {
                    // ===== NAVIGATION VERS L'ACCUEIL =====
                    // pushNamedAndRemoveUntil supprime tout l'historique de navigation
                    // (route) => false signifie "supprimer toutes les routes"
                    // Empêche l'utilisateur de revenir aux écrans d'inscription
                    // Alternative: pushReplacementNamed (remplace juste la route actuelle)
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/', // Route de l'écran d'accueil
                      (route) => false, // Supprime tout l'historique
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: AppColors.accentColor,
                    minimumSize: Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // ===== ELEVATION =====
                    // Hauteur de l'ombre du bouton (effet de profondeur)
                    // Plus le nombre est élevé, plus l'ombre est prononcée
                    elevation: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: 24),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // ===== BOUTON SECONDAIRE - EXPLORER =====
                // TextButton pour une action moins importante
                TextButton(
                  onPressed: () {
                    // Navigation vers une page d'aide ou de tutoriel
                    // Navigator.pushNamed(context, '/tutorial');
                  },
                  child: Text(
                    "Learn how to use the app",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                      // ===== DECORATION =====
                      // Ajoute un soulignement au texte
                      // Alternative: TextDecoration.overline, lineThrough
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white60,
                    ),
                  ),
                ),

                SizedBox(height: 24),

                // ===== CONFETTIS OU ANIMATION (OPTIONNEL) =====
                // Vous pourriez ajouter une animation de confettis ici
                // Package recommandé: confetti
                // Exemple:
                // ConfettiWidget(
                //   blastDirectionality: BlastDirectionality.explosive,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ===== MÉTHODE HELPER POUR LIGNE D'INFO =====
  // Widget statique réutilisable qui construit une ligne d'information
  // static car elle n'a pas besoin d'accéder à l'état du widget
  static Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        // ===== ICÔNE DANS UN CONTAINER =====
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.accentColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.accentColor, size: 20),
        ),
        SizedBox(width: 16),
        // ===== EXPANDED =====
        // Prend tout l'espace disponible entre l'icône et la valeur
        Expanded(
          child: Text(
            label,
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
        // ===== VALEUR =====
        Text(
          value,
          style: TextStyle(
            color: AppColors.accentColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ===== WIDGET BONUS: ÉCRAN DE SUCCÈS AVEC ANIMATION =====
// Version alternative avec animation simple
// À utiliser si vous voulez un effet plus dynamique
class RegistrationSuccessScreenAnimated extends StatefulWidget {
  const RegistrationSuccessScreenAnimated({super.key});

  @override
  State<RegistrationSuccessScreenAnimated> createState() =>
      _RegistrationSuccessScreenAnimatedState();
}

class _RegistrationSuccessScreenAnimatedState
    extends State<RegistrationSuccessScreenAnimated>
    with SingleTickerProviderStateMixin {
  // ===== ANIMATION CONTROLLER =====
  // Contrôle les animations personnalisées
  // SingleTickerProviderStateMixin requis pour les animations
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // ===== CONFIGURATION DE L'ANIMATION =====
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this, // this fonctionne grâce au mixin
    );

    // ===== TWEEN =====
    // Définit la plage de valeurs de l'animation (de 0.0 à 1.0)
    // CurvedAnimation ajoute une courbe d'accélération
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut, // Effet rebondissant
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Démarre l'animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            // ===== FADE TRANSITION =====
            // Widget qui anime l'opacité de son enfant
            // Alternative: AnimatedOpacity
            opacity: _fadeAnimation,
            child: ScaleTransition(
              // ===== SCALE TRANSITION =====
              // Widget qui anime l'échelle (taille) de son enfant
              // Alternative: AnimatedScale
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.celebration,
                    size: 100,
                    color: AppColors.accentColor,
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Welcome Aboard!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
