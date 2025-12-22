import 'package:flutter/material.dart';
import 'package:form_app/core/navigation/utils.dart';
import 'package:form_app/features/registration/presentation/screens/registration_personal_infos_step_screen.dart';
import 'package:form_app/features/welcome/presentation/widgets/rounded_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.teal[700]!,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.teal[700]!,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Flutter Form Flow",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        RoundedIndicator(color: Colors.green[100]!),
                        RoundedIndicator(color: Colors.green[100]!),
                        RoundedIndicator(),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Card(
                    elevation: 20,
                    shadowColor: Colors.green[400],
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/welcome_center_image.png",
                          height: 300,
                        ),
                      ),
                    ),
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
                    Center(
                      child: Text(
                        "Master navigation and form handling in Flutter. A simple, guided multi-step experience awaits you.",
                        style: TextStyle(color: Colors.white38, fontSize: 24),
                        textAlign: TextAlign.center,
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
                        backgroundColor: Colors.greenAccent[200],
                        minimumSize: Size(double.infinity, 54),
                      ),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Start Form", style: TextStyle(fontSize: 18)),
                          Icon(Icons.arrow_forward, size: 24),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 3,
                      children: [
                        Icon(Icons.info, color: Colors.white),
                        Text(
                          "Learn about this project",
                          style: TextStyle(color: Colors.white38, fontSize: 24),
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
    );
  }
}
