import 'package:flutter/material.dart';
import 'package:moonpaiv3/screens/home/home.dart';
import 'package:moonpaiv3/screens/login/mainlogin.dart';
import 'package:moonpaiv3/screens/profile/profile.dart';
import 'package:moonpaiv3/screens/regions/fontaine.dart';
import 'package:moonpaiv3/screens/regions/inazuma.dart';
import 'package:moonpaiv3/screens/regions/liyue.dart';
import 'package:moonpaiv3/screens/regions/mondstat.dart';
import 'package:moonpaiv3/screens/regions/sumeru.dart';

class LocalButtons {
  static const Color buttonColor = Colors.transparent;

  static Widget homeButton(BuildContext context,
      {required VoidCallback onPressed, required bool isAlreadyInHome}) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ HOME BUTTON
      bottom: screenSize.height * 0.033,
      left: screenSize.width * 0.433,
      child: GestureDetector(
        onTap: () {
          if (!isAlreadyInHome) {
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            });
          }
          onPressed();
        },
        child: Container(
          width: 63,
          height: 63,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget backButton(BuildContext context, VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ BACK BUTTON
      top: screenSize.height * 0.039,
      left: screenSize.width * 0.03,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.pop(context);
          });
        },
        child: Container(
          width: 56,
          height: 56,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget profileButton(BuildContext context,
      {required VoidCallback onPressed,
      required bool isAlreadyInProfile,
      required bool isLoggedIn}) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ PROFILE BUTTON
      top: screenSize.height * 0.039,
      right: screenSize.width * 0.045,
      child: GestureDetector(
        onTap: () {
          if (!isAlreadyInProfile) {
            if (isLoggedIn) {
              Future.delayed(const Duration(milliseconds: 100), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              });
            } else {
              Future.delayed(const Duration(milliseconds: 100), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              });
            }
          }
          onPressed();
        },
        child: Container(
          width: 63,
          height: 63,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget mondstatButton(BuildContext context, VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ MONDSTAT BUTTON
      top: screenSize.height * 0.252,
      left: screenSize.width * 0.141,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MondstatPage(),
              ),
            );
          });
        },
        child: Container(
          width: 130,
          height: 160,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget liyueButton(BuildContext context, VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ LIYUE BUTTON
      top: screenSize.height * 0.252,
      right: screenSize.width * 0.141,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LiyuePage()),
            );
          });
        },
        child: Container(
          width: 130,
          height: 160,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget sumeruButton(BuildContext context, VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ SUMERU BUTTON
      bottom: screenSize.height * 0.381,
      right: screenSize.width * 0.134,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SumeruPage()),
            );
          });
        },
        child: Container(
          width: 130,
          height: 160,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget inazumaButton(BuildContext context, VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ INAZUMA BUTTON
      bottom: screenSize.height * 0.381,
      left: screenSize.width * 0.141,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InazumaPage()),
            );
          });
        },
        child: Container(
          width: 130,
          height: 160,
          color: buttonColor,
        ),
      ),
    );
  }

  static Widget fontaineButton(BuildContext context, VoidCallback onPressed) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      // <------ FONTAINE BUTTON
      bottom: screenSize.height * 0.178,
      left: screenSize.width * 0.363,
      child: GestureDetector(
        onTap: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FontainePage()),
            );
          });
        },
        child: Container(
          width: 130,
          height: 163,
          color: buttonColor,
        ),
      ),
    );
  }

}
