import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/regions/inazuma/ayato.dart';
import 'package:moonpaiv3/screens/regions/inazuma/heizhou.dart';
import 'package:moonpaiv3/screens/regions/inazuma/miko.dart';
import 'package:moonpaiv3/screens/regions/inazuma/raiden.dart';
import 'package:moonpaiv3/screens/regions/inazuma/sayu.dart';
import 'package:moonpaiv3/screens/regions/inazuma/yoimiya.dart';
import 'package:provider/provider.dart';

class InazumaPage extends StatefulWidget {
  const InazumaPage({Key? key}) : super(key: key);

  @override
  State<InazumaPage> createState() => _InazumaPageState();
}

class _InazumaPageState extends State<InazumaPage> {
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
                image: AssetImage('images/regions/inazuma.png'),
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
                      builder: (context) => const Raiden(),
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
                      builder: (context) => const Miko(),
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
                      builder: (context) => const Yoimiya(),
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
                      builder: (context) => const Sayu(),
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
                      builder: (context) => const Ayato(),
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
                      builder: (context) => const Heizou(),
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
