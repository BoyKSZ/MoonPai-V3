import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List userdata = [];
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> insertuser() async {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        String uri = 'http://10.0.2.2/moonpai_api/insert_record.php';
        var res = await http.post(Uri.parse(uri), body: {
          'usernameController': usernameController.text,
          'passwordController': passwordController.text,
        });

        var response = jsonDecode(res.body);
        if (response['success'] == 'true') {
          print('Record Inserted');
          usernameController.text = '';
          passwordController.text = '';
        } else {
          print('Error Inserting Record!');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('Please fill both username and password');
    }
  }

  Future<bool> checkUsernameExists(String username) async {
    try {
      String uri = 'http://10.0.2.2/moonpai_api/check_login.php';
      var res = await http.post(Uri.parse(uri), body: {'username': username});
      var response = jsonDecode(res.body);
      return response['exists'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  void attemptLogin() async {
    String username = usernameController.text;
    bool exists = await checkUsernameExists(username);

    if (exists) {
      Provider.of<authModel>(context, listen: false).login(username);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Profile(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Username not found"),
            content: const Text("Account does not exist. Please click 'Create Account' instead."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    bool isAlreadyInHome = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/loginpagev2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          LocalButtons.homeButton(context, onPressed: () {
            setState(() {
              isAlreadyInHome = true;
            });
          }, isAlreadyInHome: isAlreadyInHome), // home button
          LocalButtons.backButton(context, () {}),
          LocalButtons.profileButton(context, onPressed: () {},
              isAlreadyInProfile: true,
              isLoggedIn: Provider.of<authModel>(context).isLoggedIn),

          Positioned(
            left: screenSize.width * 0.169,
            bottom: screenSize.height * 0.600,
            child: SizedBox(
              height: screenSize.height * 0.04,
              width: screenSize.width * 0.67,
              child: TextField(
                style: const TextStyle(fontSize: 12.6),
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: 'Enter username',
                    border: InputBorder.none),
              ),
            ),
          ),
          Positioned(
            left: screenSize.width * 0.169,
            bottom: screenSize.height * 0.536,
            child: SizedBox(
              height: screenSize.height * 0.04,
              width: screenSize.width * 0.67,
              child: TextField(
                style: const TextStyle(fontSize: 12),
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Enter password',
                    border: InputBorder.none),
              ),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.499,
            left: screenSize.width * 0.353,
            child: GestureDetector(
              onTap: () {
                attemptLogin(); 
              },
              child: Container(
                width: 124,
                height: 24,
                color: Colors.transparent,
              ),
            ),
          ),

           Positioned(
            bottom: screenSize.height * 0.452,
            left: screenSize.width * 0.353,
            child: GestureDetector(
              onTap: () {
                insertuser();

                Provider.of<authModel>(context, listen: false).login(usernameController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                );
              },
              child: Container(
                width: 124,
                height: 24,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


