import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/login/accountList.dart';
import 'package:moonpaiv3/screens/login/mainlogin.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final AuthModel = Provider.of<authModel>(context);
    bool isAlreadyInHome = false;
    bool isAlreadyInProfile = true;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/loginpagev3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          LocalButtons.homeButton(context,
              onPressed: () {}, isAlreadyInHome: isAlreadyInHome),
          LocalButtons.backButton(context, () {}),
          LocalButtons.profileButton(context, onPressed: () {
            print('Already in Profile!');
          },
              isAlreadyInProfile: isAlreadyInProfile,
              isLoggedIn: Provider.of<authModel>(context).isLoggedIn),
          Positioned(
            // <------ VIEW ACCS BUTTON
            bottom: screenSize.height * 0.345,
            left: screenSize.width * 0.323,
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewAccs(),
                    ),
                  );
                });
              },
              child: Container(
                width: 165,
                height: 40,
                color: Colors.transparent,
              ),
            ),
          ),
          
          Positioned(
            // <------ LOGOUT BUTTON
            bottom: screenSize.height * 0.428,
            right: screenSize.width * 0.154,
            child: GestureDetector(
              onTap: () {
                Provider.of<authModel>(context, listen: false).logout();
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                });
              },
              child: Container(
                width: 124,
                height: 30,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            // <------ USERNAME DISPLAY
            bottom: screenSize.height * 0.670,
            right: screenSize.width * 0.184,
            child: Container(
              width: 124,
              height: 30,
              color: Colors.transparent,
              child: Text('${AuthModel.currrentUser}', textAlign: TextAlign.center,),
            ),
          ),

          Positioned(
            // <------ DISPLAY
            bottom: screenSize.height * 0.628,
            right: screenSize.width * 0.184,
            child: Container(
              width: 124,
              height: 30,
              color: Colors.transparent,
              child: Text('moonpai :D', textAlign: TextAlign.center,),
            ),
          ),

          Positioned(
            // <------ DESCRIPTION
            bottom: screenSize.height * 0.490,
            left: screenSize.width * 0.145,
            child: GestureDetector(
              onTap: () {
                Provider.of<authModel>(context, listen: false).logout();
                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                });
              },
              child: Container(
                width: 322,
                height: 64,
                color: Colors.transparent,

                child: Text("Hello..."),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
