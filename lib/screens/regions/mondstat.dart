import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/regions/mondstat/bennett.dart';
import 'package:moonpaiv3/screens/regions/mondstat/jean.dart';
import 'package:moonpaiv3/screens/regions/mondstat/kaeya.dart';
import 'package:moonpaiv3/screens/regions/mondstat/klee.dart';
import 'package:moonpaiv3/screens/regions/mondstat/mona.dart';
import 'package:moonpaiv3/screens/regions/mondstat/venti.dart';
import 'package:provider/provider.dart';

class MondstatPage extends StatefulWidget {
  const MondstatPage({super.key});

  @override
  State<MondstatPage> createState() => _MondstatPageState();
}

class _MondstatPageState extends State<MondstatPage> {
  @override
  Widget build(BuildContext context) {
    bool isAlreadyInHome = false;
    bool isAlreadyInProfile = false;
    final screenSize = MediaQuery.of(context).size;
    const Color buttonColor = Colors.transparent;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/regions/mondstat_charactersv5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          LocalButtons.backButton(context, () {}),
          LocalButtons.homeButton(context,
              onPressed: () {}, isAlreadyInHome: isAlreadyInHome),
          LocalButtons.profileButton(context,
              onPressed: () {},
              isAlreadyInProfile: isAlreadyInProfile,
              isLoggedIn: Provider.of<authModel>(context).isLoggedIn),

          // PROFILE BUTTONS

          Positioned(
            top: screenSize.height * 0.252,
            left: screenSize.width * 0.065,
            child: GestureDetector(
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Venti(),
                    ),
                  );
              },
              child: Container(
                width: 110,
                height: 140,
                color: buttonColor,
              ),
            ),
          ),

          Positioned(
            top: screenSize.height * 0.252,
            left: screenSize.width * 0.376,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Jean(),
                    ),
                  );
                });
              },
              child: Container(
                width: 110,
                height: 140,
                color: buttonColor,
              ),
            ),
          ),

          Positioned(
            top: screenSize.height * 0.252,
            left: screenSize.width * 0.685,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Kaeya(),
                    ),
                  );
                });
              },
              child: Container(
                width: 110,
                height: 140,
                color: buttonColor,
              ),
            ),
          ),

          Positioned(
            top: screenSize.height * 0.420,
            left: screenSize.width * 0.065,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Bennett(),
                    ),
                  );
                });
              },
              child: Container(
                width: 110,
                height: 140,
                color: buttonColor,
              ),
            ),
          ),

          Positioned(
            top: screenSize.height * 0.420,
            left: screenSize.width * 0.376,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Klee(),
                    ),
                  );
                });
              },
              child: Container(
                width: 110,
                height: 140,
                color: buttonColor,
              ),
            ),
          ),

          Positioned(
            top: screenSize.height * 0.420,
            left: screenSize.width * 0.685,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mona(),
                    ),
                  );
                });
              },
              child: Container(
                width: 110,
                height: 140,
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
