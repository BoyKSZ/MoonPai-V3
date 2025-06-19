import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'screens/login/mainlogin.dart';
import 'screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => authModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Zhongli-China'),
        home: const Home(),
      ),
    );
  }
}

class authModel extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _currentUser = '';

  bool get isLoggedIn => _isLoggedIn;
  String get currrentUser => _currentUser;

  void login(String username) {
    _isLoggedIn = true;
    _currentUser = username;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _currentUser = '';
    notifyListeners();
  }
}
