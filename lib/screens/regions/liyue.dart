import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/regions/liyue/baizhu.dart';
import 'package:moonpaiv3/screens/regions/liyue/chongyun.dart';
import 'package:moonpaiv3/screens/regions/liyue/hutao.dart';
import 'package:moonpaiv3/screens/regions/liyue/ningguang.dart';
import 'package:moonpaiv3/screens/regions/liyue/qiqi.dart';
import 'package:moonpaiv3/screens/regions/liyue/zhongli.dart';
import 'package:provider/provider.dart';

class LiyuePage extends StatefulWidget {
  const LiyuePage({super.key});

  @override
  State<LiyuePage> createState() => _LiyuePageState();
}

class _LiyuePageState extends State<LiyuePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    bool isAlreadyInHome = false;
    bool isAlreadyInProfile = false;
    const Color buttonColor = Colors.transparent;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/regions/liyue.png'),
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
                      builder: (context) => const Zhongli(),
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
                      builder: (context) => const Ningguang(),
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
                      builder: (context) => const Hutao(),
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
                      builder: (context) => const Qiqi(),
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
                Future.delayed(const Duration(milliseconds: 400), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Baizhu(),
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
                Future.delayed(const Duration(milliseconds: 400), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Chongyun(),
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
