import 'package:flutter/material.dart';
import 'package:form_app/core/constants/colors.dart';
import 'package:form_app/core/navigation/utils.dart';
import 'package:form_app/features/registration/presentation/screens/registration_personal_infos_step_screen.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: AppColors.primaryColor,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Flutter Form Flow",
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            RoundedIndicator(color: Colors.green[900]!),
                            RoundedIndicator(color: Colors.green[900]!),
                            RoundedIndicator(),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Center(
                              child: Card(
                                color: Colors.transparent,
                                elevation: 20,
                                shadowColor: Colors.green[400],
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(27),
                                    child: Image.asset(
                                      "assets/welcome_center_image.png",
                                      height: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 36,
                            right: 180,
                            child: Card(
                              color: Colors.green[100]!.withOpacity(0.3),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green[400],
                                  size: 48,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            "Welcome Aboard",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Center(
                            child: Text(
                              "Master navigation and form handling in Flutter. A simple, guided multi-step experience awaits you.",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      spacing: 20,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            navigateToPage(
                              context,
                              RegistrationPersonalInfosStepScreen(),
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => HomePage()),
                            // );
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(builder: (context) => HomePage()),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: AppColors.accentColor,
                            minimumSize: Size(double.infinity, 54),
                          ),
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Start Form",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(Icons.arrow_forward, size: 24),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 3,
                          children: [
                            Icon(Icons.info, color: Colors.white30),
                            Text(
                              "Learn about this project",
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
