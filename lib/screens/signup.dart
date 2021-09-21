import 'package:campus/widgets/widgets.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:campus/services/auth.dart";
import "package:campus/screens/chat_room_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:campus/services/database.dart";

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {

    TextEditingController emailEditingController = new TextEditingController();
    TextEditingController passwordEditingController = new TextEditingController();
    TextEditingController usernameEditingController = new TextEditingController();

    final formKey = GlobalKey<FormState>();
    bool isLoading = false;

    AuthService authService = new AuthService();
    DatabaseMethods databaseMethods = new DatabaseMethods();

    signUp() async {
      if(formKey.currentState!.validate()) {
        Map<String, String> userInfoMap = {
          "name" : usernameEditingController.text,
          "email" : emailEditingController.text,
        };
        setState(() {
          isLoading = true;
        });

        await authService.signUpWithEmailAndPassword(
          emailEditingController.text,
          passwordEditingController.text).then((result) {
          //if (result != null)
          databaseMethods.uploadUserInfo(userInfoMap);
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => ChatRoom()
            ));
          }

        );

      }
    }

    return Scaffold(
      //appBar: appBarMain(context),
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator())) : Container(
        decoration: BoxDecoration(
          image: DecorationImage(image:
            AssetImage(
              "assets/images/login_bg.jpg",),
            fit: BoxFit.cover),
        ),
        child: Container(
          child: Stack(
          children: [
          Positioned(
          top: 250,
          left: 0,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          		children: [
          			Text("Let's get you", style: GoogleFonts.raleway(
          						fontSize: 28, color: Colors.grey.shade50, fontWeight: FontWeight.w600)),
          			Text("                          started...", style: GoogleFonts.raleway(
          						fontSize: 28, color: Colors.grey.shade800, fontWeight: FontWeight.w600))
          			])),

          Positioned(
            bottom: 0,

            child: Container(
            decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(35),
          					topLeft: Radius.circular(35))),
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: MediaQuery.of(context).size.width,
            child:
            Column(
          children: [
            //Spacer(),
            Form(
              child: Column(
                children: [
                SizedBox(height: 20),
                SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child:
                  TextFormField(
                    validator: (val) {
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~] +@[a-      zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ? null : "Enter correct email";
                    },
                    controller: emailEditingController,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Email")
                  )),
                  SizedBox(height: 10),
                  SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child:
                    TextFormField(
                      validator: (val) {
                        return val!.isEmpty || val.length < 3 ? "Enter username with 3+ characters" : null;
                      },
                      controller: usernameEditingController,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("Username")
                    )),
                    SizedBox(height: 10),
                  SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child:
                  TextFormField(
                    controller: passwordEditingController,
                    obscureText: true,
                    validator: (val) {
                      return val!.length > 6
                          ? null
                          : "Enter Password with 6+ characters";
                    },
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Password"),
                  )
                  ),
                ])
            ),

            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                signUp();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff007EF4),
                      const Color(0xff2A75BC),
                    ]
                  )
                ),
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    widget.toggle();
                  },
                  child:
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Sign Up",
                        style: biggerTextStyle(),
                        textAlign: TextAlign.center,
                )),),
              )
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[800],
              ),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Sign In with Google",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              )
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: simpleTextStyle(),
                ),
                SizedBox(width: 5),
                Text(
                  "Sign In now",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                    decoration: TextDecoration.underline
                  )
                ),
              ],
            ),
            SizedBox(height: 30),

          ],
        ),),
      )
      ]
      )
    )
      )

    );
  }
}
