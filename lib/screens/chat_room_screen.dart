import 'package:campus/helper/authenticate.dart';
import 'package:campus/screens/signin.dart';
import "package:flutter/material.dart";
import "package:campus/widgets/widgets.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:campus/services/auth.dart";
import 'package:campus/screens/search.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campus"), actions: [
        GestureDetector(
            onTap: () {
              authService.signOut();
<<<<<<< HEAD
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => SignIn()
              ));
=======
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
>>>>>>> ec18d1d8537999f0a632eac3b31a5d54af922c0d
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)))
      ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Search()));
          }),
    );
  }
}
