import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moonpaiv3/localbuttons/local_buttons.dart';
import 'package:provider/provider.dart';
import 'package:moonpaiv3/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Heizou extends StatefulWidget {
  const Heizou({Key? key}) : super(key: key);

  @override
  _HeizouState createState() => _HeizouState();
}

class _HeizouState extends State<Heizou> {            // edit mo ung class name 
  Map<String, dynamic>? profileData;

  Future<void> getProfile() async {
    String charID = "24";   // ung character id, refer mo ung sa excel sheet

    String uri = "http://10.0.2.2/moonpai_api/view_record.php?charID=$charID";
    try {
      var response = await http.get(Uri.parse(uri));

      setState(() {
        profileData = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }


  bool isAlreadyInHome = false;
  bool isAlreadyInProfile = false;
  int activePage = 0;

  List<String> imagePaths = [               // etong paths, kung pano sila nakapangalan sa drive (assets -> character profiles), all caps nmn lahat
    'images/character_profiles/HEIZOU/HEIZOU_PROFILE.png',
    'images/character_profiles/HEIZOU/HEIZOU_STORY.png',
    'images/character_profiles/HEIZOU/HEIZOU_TALENT.png'
  ];

  @override
  Widget build(BuildContext context) {
    String categoryImage = '';
    if (activePage == 1) {
      categoryImage = 'images/lore.png';
    } else if (activePage == 2) {
      categoryImage = 'images/talents.png';
    }
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/characterlistBG_base.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: CarouselSlider(
              items: imagePaths.map((path) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: 1200,
                        height: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Stack(
                          children: [
                              Container(
                              width: 500,
                              height: 640,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              child: Stack(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Image(image: AssetImage(path))],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if(activePage > 0) 
                              Positioned(
                                bottom: 0.5,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: 400,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                  ),
                                  child: Image(
                                      image: AssetImage(categoryImage)),
                                ),
                              ),
                            if(activePage == 0)
                              Positioned(
                                top: 77.5,
                                right: 29,
                                left: 256,
                                child: Container(
                                  width: 40,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(255, 39, 42, 84),
                                    // color: Colors.red,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 8.5, height: 1.82, fontFamily: 'Zhongli-China'),
                                      children: <TextSpan>[
                                        TextSpan(text: ' ${profileData?['rarity'] ?? 'N/A'}'),
                                        TextSpan(text: '\n ${profileData?['weapon'] ?? 'N/A'}'),
                                        TextSpan(text: '\n ${profileData?['element'] ?? 'N/A'}'),
                                        TextSpan(text: '\n ${profileData?['model'] ?? 'N/A'}', style: TextStyle(fontSize: 8)),
                                        TextSpan(text: '\n ${profileData?['constellation'] ?? 'N/A'}', style: TextStyle(fontSize: 7.8)),
                                        TextSpan(text: '\n ${profileData?['region'] ?? 'N/A'}'),
                                        TextSpan(text: '\n ${profileData?['bday'] ?? 'N/A'}'),
                                        TextSpan(text: '\n ${profileData?['relDate'] ?? 'N/A'}'),
                                      ]
                                    ))
                                ),
                              ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 1/30,
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.bounceInOut,
                onPageChanged: (index, reason) {
                  setState(() {
                    activePage = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 820,
            child: Container(
              width: 448,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/characterlistBG_bottombar.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          LocalButtons.backButton(context, () {}),
          LocalButtons.homeButton(context,
              onPressed: () {}, isAlreadyInHome: isAlreadyInHome),
          LocalButtons.profileButton(context,
              onPressed: () {},
              isAlreadyInProfile: isAlreadyInProfile,
              isLoggedIn: Provider.of<authModel>(context).isLoggedIn)
        ],
      ),
    );
  }
}