import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isAlreadyInHome = true;
    bool isAlreadyInProfile = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/homescreen.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          LocalButtons.homeButton(context, onPressed: () {
            print('Already in Home!');
            
          }, isAlreadyInHome: isAlreadyInHome),
          LocalButtons.backButton(context, () {}),
          LocalButtons.profileButton(context, onPressed: () {}, isAlreadyInProfile: isAlreadyInProfile, isLoggedIn: Provider.of<authModel>(context).isLoggedIn),
          LocalButtons.mondstatButton(context, () {}),
          LocalButtons.liyueButton(context, () {}),
          LocalButtons.inazumaButton(context, () {}),
          LocalButtons.sumeruButton(context, () {}),
          LocalButtons.fontaineButton(context, () {}),
          
        ],
      ),
    );
  }
}
