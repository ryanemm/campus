import 'package:campus/widgets/widgets.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarMain(context),
      body: Container(
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
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("Email")
                  )),
                  SizedBox(height: 10),
                  SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child:
                  TextFormField(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,),
                child: Text("Forgot Password?",
                              style: simpleTextStyle(),
                            ),
              )
            ],         ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                //add later
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
                child: Text(
                  "Sign In",
                  style: biggerTextStyle(),
                  textAlign: TextAlign.center,
                )
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
                  "Don't have an account?",
                  style: simpleTextStyle(),
                ),
                SizedBox(width: 5),
                Text(
                  "Register now",
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
