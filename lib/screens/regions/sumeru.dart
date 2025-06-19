import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/regions/sumeru/cyno.dart';
import 'package:moonpaiv3/screens/regions/sumeru/dehya.dart';
import 'package:moonpaiv3/screens/regions/sumeru/dori.dart';
import 'package:moonpaiv3/screens/regions/sumeru/kaveh.dart';
import 'package:moonpaiv3/screens/regions/sumeru/nahida.dart';
import 'package:provider/provider.dart';
import 'package:moonpaiv3/screens/regions/sumeru/faruzan.dart';

class SumeruPage extends StatefulWidget {
  const SumeruPage({Key? key}) : super(key: key);

  @override
  State<SumeruPage> createState() => _SumeruPageState();
}

class _SumeruPageState extends State<SumeruPage> {
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
                image: AssetImage('images/regions/sumeru.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          LocalButtons.backButton(context, () {}),
          LocalButtons.homeButton(context,
              onPressed: () {}, isAlreadyInHome: isAlreadyInHome),
          LocalButtons.profileButton(context,
              onPressed: () {}, isAlreadyInProfile: isAlreadyInProfile, isLoggedIn: Provider.of<authModel>(context).isLoggedIn),
          

           // PROFILE BUTTONS

          Positioned(
            top: screenSize.height * 0.252,
            left: screenSize.width * 0.065,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Nahida(),
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
            left: screenSize.width * 0.376,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dehya(),
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
                      builder: (context) => const Faruzan(),
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
                      builder: (context) => const Dori(),
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
                      builder: (context) => const Kaveh(),
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
                      builder: (context) => const Cyno(),
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
