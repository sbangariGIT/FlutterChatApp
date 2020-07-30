import 'package:app/userInfo.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import '../helper.dart';

class myFeed extends StatefulWidget {
  @override
  _myFeedState createState() => _myFeedState();
}

class _myFeedState extends State<myFeed> {
  DatabaseMethods db = DatabaseMethods();
  Stream currentFeed;

  @override
  void initState() {
    getUserInfogetChats();
    print("hi");
    super.initState();
  }

  Widget feed() {
    return StreamBuilder(
        stream: currentFeed,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          snapshot.data.documents[index].data['sportName']),
                      subtitle: Text(
                          snapshot.data.documents[index].data['Purpose'] +
                              "  " +
                              snapshot.data.documents[index].data['Date']),
                      leading: Icon(Icons.play_arrow),
                    );
                  })
              : Container();
        });
  }

  getUserInfogetChats() async {
    UserInfo.currentUserName =
        await HelperFunctions.getUserNameSharedPreference();
    db.getFeed().then((snapshot) {
      setState(() {
        print("hi");
        currentFeed = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Feed"),
      ),
      body: feed(),
    );
  }
}
