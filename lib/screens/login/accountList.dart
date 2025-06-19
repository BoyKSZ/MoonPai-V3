import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:moonpaiv3/main.dart';
import 'package:moonpaiv3/screens/login/updateaccount.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ViewAccs extends StatefulWidget {
  const ViewAccs({Key? key}) : super(key: key);

  @override
  State<ViewAccs> createState() => _ViewAccsState();
}

class _ViewAccsState extends State<ViewAccs> {
  List userinfo = [];

  Future<void> delInfo(String id, String adminkey) async {
    if (adminkey == 'adminpass123') {
      String uri = "http://10.0.2.2/moonpai_api/delete_userinfo.php";

      try {
        var res = await http.post(Uri.parse(uri), body: {"id": id});
        var response = jsonDecode(res.body);

        if (response["success"] == "true") {
          print('Record deleted.');
          getAccounts();
        } else {
          print('Issue in deleting record...');
        }
      } catch (e) {
        print(e);
      }
    } else {
      showSnackBar('Incorrect admin key!');
    }
  }

  Future<void> getAccounts() async {
    String uri = "http://10.0.2.2/moonpai_api/view_accounts.php";

    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userinfo = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getAccounts();
  }

  Future<void> _promptAdminKey(Function callback) async {
    TextEditingController adminKeyController = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Admin Key'),
          content: TextField(
            controller: adminKeyController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Admin Key',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                callback(adminKeyController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Color.fromARGB(255, 58, 59, 126)),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isAlreadyInHome = false;
    bool isAlreadyInProfile = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/characterlistBG_base.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: ListView.builder(
                itemCount: userinfo.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 58, 59, 126),
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateAccount(
                              userinfo[index]["uname"],
                              userinfo[index]["upassword"],
                            ),
                          ),
                        ).then((value) => setState(() {
                              getAccounts();
                            }));
                      },
                      leading: const Icon(
                        Icons.file_upload_rounded,
                        color: Colors.white,
                      ),
                      textColor: Colors.white,
                      title: Text('Account name: ${userinfo[index]["uname"]}'),
                      subtitle:
                          Text('Acount number: 00${userinfo[index]["uid"]}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.white,
                        onPressed: () {
                          var uid = userinfo[index]["uid"];
                          var uname = userinfo[index]["uname"];
                          if (uid != null) {
                            _promptAdminKey((adminKey) {
                              delInfo(uid, adminKey);
                              print(
                                  "Logging out user: ${Provider.of<authModel>(context, listen: false).currrentUser}");
                              if (uname ==
                                  Provider.of<authModel>(context, listen: false)
                                      .currrentUser) {
                                Provider.of<authModel>(context, listen: false)
                                    .logout();
                              }
                            });
                          } else {
                            print("UID is null. Unable to delete.");
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          LocalButtons.homeButton(
            context,
            onPressed: () {},
            isAlreadyInHome: isAlreadyInHome,
          ),
          LocalButtons.backButton(context, () {}),
          LocalButtons.profileButton(
            context,
            onPressed: () {
              print('Already in Profile!');
            },
            isAlreadyInProfile: isAlreadyInProfile,
            isLoggedIn: Provider.of<authModel>(context).isLoggedIn,
          ),
        ],
      ),
    );
  }
}
