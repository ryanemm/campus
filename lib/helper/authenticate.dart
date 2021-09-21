import 'package:campus/screens/signin.dart';
import 'package:campus/screens/signup.dart';
import "package:flutter/material.dart";

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView() {
    //change the value of showSignIn depending on current value
    setState(() {
      //assign opposite boolean value
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return showSignIn ? SignIn(toggleView) : SignUp(toggleView);
  }
}
