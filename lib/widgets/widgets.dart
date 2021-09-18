import "package:flutter/material.dart";

PreferredSize appBarMain(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(title: Image.asset("assets/images/logo.png", height: 40,
    ),
    elevation:0.0,
    centerTitle: false
  ),);
}

TextStyle simpleTextStyle () {
  return TextStyle(color: Colors.grey.shade800, fontSize: 16);
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Colors.grey[400]),
    focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
    enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade600)),
  );
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
