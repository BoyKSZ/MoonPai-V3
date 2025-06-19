import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/regions/fontaine/furina.dart';
import 'package:moonpaiv3/screens/regions/fontaine/lynette.dart';
import 'package:moonpaiv3/screens/regions/fontaine/lyney.dart';
import 'package:moonpaiv3/screens/regions/fontaine/navia.dart';
import 'package:moonpaiv3/screens/regions/fontaine/wriothesley.dart';
import 'package:provider/provider.dart';

class FontainePage extends StatefulWidget {
  const FontainePage({Key? key}) : super(key: key);

  @override
  State<FontainePage> createState() => _FontainePageState();
}

class _FontainePageState extends State<FontainePage> {
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
                image: AssetImage('images/regions/fontaine.png'),
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
                  builder: (context) => const Furina(),
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
                  builder: (context) => const Navia(),
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
                  builder: (context) => const Lynette(),
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
        left: screenSize.width * 0.225,
        child: GestureDetector(
          onTap: () {
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Wriothesley(),
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
        left: screenSize.width * 0.535,
        child: GestureDetector(
          onTap: () {
            Future.delayed(const Duration(milliseconds: 100), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Lyney(),
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
