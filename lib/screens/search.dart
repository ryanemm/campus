import 'package:campus/widgets/widgets.dart';
import "package:flutter/material.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        color: Color(0x54FFFFFF),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search username",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      border: InputBorder.none),
                  )),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [const Color(0x36FFFFFF),
                                const Color(0x0FFFFFFF)]
                    ),
                    borderRadius: (BorderRadius.circular(40))
                  ),
                  child: Image.asset("assets/images/search.png")
                ),
              ]
            )),
          ],
        )
      ),
    );
  }
}
