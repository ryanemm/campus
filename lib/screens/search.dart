import 'package:campus/widgets/widgets.dart';
import "package:flutter/material.dart";
import "package:campus/services/database.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController searchTextEditingController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot? searchSnapshot;

  initiateSearch() {
    databaseMethods.getUserByUsername(searchTextEditingController.text)
    .then((val) {
      setState(() {
        searchSnapshot = val;
      });
      //print(val.toString());
      //searchSnapshot = val;
    });
  }

  ///create a chat room, send user to said conversation screen, pushReplacement
  createChatRoomAndStartConversation(String username) {
    List<String> users = [username, myName];
    databaseMethods.createChatRoom(chatRoomId, chatRoomMap);
  }

  Widget searchList() {
    return searchSnapshot != null ? ListView.builder(
      itemCount: searchSnapshot?.docs.length,
      itemBuilder: (context, index) {
        return SearchTile(
          username : searchSnapshot?.docs[index].get("name").toString(),
          userEmail: searchSnapshot?.docs[index].get("email").toString(),
        );
      }
    ) : Container();
  }

  @override
  void initState() {
    //initiateSearch();
    super.initState();
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: searchTextEditingController,
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
                GestureDetector(
                  onTap: () {
                    initiateSearch();
                  },
                  child: Container(
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
                ),),
              ]
            )),
            searchList(),
          ],
        )
      ),
    );
  }
}

class SearchTile extends StatelessWidget {

final String? username;
final String? userEmail;
SearchTile({this.username = "", this.userEmail = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [Text(username!, style: simpleTextStyle()),
                        Text(userEmail!, style: simpleTextStyle())]
          ),
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text("Message", style: mediumTextStyle()),
          )),
        ]
      )
    );
  }
}
