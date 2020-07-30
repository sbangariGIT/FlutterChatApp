import 'package:app/chat/chat.dart';
import 'package:app/userInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import '../helper.dart';

class myTeams extends StatefulWidget {
  @override
  _myTeamsState createState() => _myTeamsState();
}

class _myTeamsState extends State<myTeams> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: SafeArea(
                child: Column(children: <Widget>[
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Chats',
                ),
                Tab(
                  text: 'Schedule',
                ),
              ], // list of tabs
            ),
          ),
          //TabBarView(children: [ImageList(),])
          Expanded(
            child: TabBarView(
              children: [
                chats(),
                schedule(), // class name
              ],
            ),
          ),
        ]))));
  }
}

class chats extends StatefulWidget {
  @override
  _chatsState createState() => _chatsState();
}

class _chatsState extends State<chats> {
  Stream chatRooms;

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Conversation(
                                    chatRoomId: snapshot.data.documents[index]
                                        .data["chatRoomId"],
                                  )));
                    },
                    title: Text(
                      snapshot.data.documents[index].data['chatRoomId']
                          .toString()
                          .replaceAll("_", "")
                          .replaceAll(UserInfo.currentUserName, ""),
                    ),
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.send),
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() {
    DatabaseMethods().getUserChats(UserInfo.currentUserName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${UserInfo.currentUserName}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: Container(
              height: 30,
              margin: EdgeInsets.fromLTRB(300, 30, 0, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange[900]),
              child: Center(
                child: Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )),
        chatRoomsList(),
      ],
    ));
  }
}

class schedule extends StatefulWidget {
  @override
  _scheduleState createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text('Schedule')),
    );
  }
}
