import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Pages/home.dart';
import './Pages/login.dart';

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => new _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isLoggedIn;

  @override
  void initState() {
    isLoggedIn = false;
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
            isLoggedIn = true;
          })
        : null);
    super.initState();
    // new Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
        ? new MyHomePage(
            title: 'Agrrio',
          )
        : new LoginScreen();
  }
}
