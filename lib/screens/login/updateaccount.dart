import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UpdateAccount extends StatefulWidget {
  String name;
  String password;
  UpdateAccount(this.name, this.password);

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> updateRecord() async {
    try {
      String uri = "http://10.0.2.2/moonpai_api/update_record.php";

      var res = await http.post(Uri.parse(uri), body: {
        "usernameController": usernameController.text,
        "passwordController": passwordController.text,
      });

      var response = jsonDecode(res.body);
      if (response["success"] == "true") {
        print("Updated Profile");
      } else {
        print("Error updating profile");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    usernameController.text = widget.name;
    passwordController.text = widget.password;
    super.initState();
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
                image: AssetImage('images/updatelogin.png'),
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
          LocalButtons.profileButton(context,
              onPressed: () {},
              isAlreadyInProfile: true,
              isLoggedIn: Provider.of<authModel>(context).isLoggedIn),

          Positioned(
            // username widget
            left: screenSize.width * 0.169,
            bottom: screenSize.height * 0.590,
            child: SizedBox(
              height: screenSize.height * 0.04,
              width: screenSize.width * 0.67,
              child: Text( usernameController.text         
              ),
            ),
          ),
          Positioned(
            // password widget
            left: screenSize.width * 0.169,
            bottom: screenSize.height * 0.536,
            child: SizedBox(
              height: screenSize.height * 0.04,
              width: screenSize.width * 0.67,
              child: TextField(
                style: const TextStyle(fontSize: 12),
                controller: passwordController,
                decoration: const InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'Enter password',
                    border: InputBorder.none),
              ),
            ),
          ),

          Positioned(
            // <------ UPDATE BUTTON
            bottom: screenSize.height * 0.499,
            left: screenSize.width * 0.353,
            child: GestureDetector(
              onTap: () {
                // insertuser();
                updateRecord();
                String username = usernameController.text;
                Provider.of<authModel>(context, listen: false).login(username);

                Future.delayed(const Duration(milliseconds: 100), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                });
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
