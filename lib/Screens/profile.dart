import 'package:app/authentication/auth.dart';
import 'package:app/authentication/login_screen.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
              elevation: 0.0,
              centerTitle: false,
              actions: [
                GestureDetector(
                  onTap: () async {
                    await AuthService().signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => login()));
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.exit_to_app)),
                )
              ],
            ),
            body: SafeArea(
                child: Column(children: <Widget>[
              Container(
                color: Colors.greenAccent,
                height: MediaQuery.of(context).size.height /
                    5, // Also Including Tab-bar height.
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
              ),
              PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'My Teams',
                    ),
                    Tab(
                      text: 'Firends',
                    ),
                  ], // list of tabs
                ),
              ),
              //TabBarView(children: [ImageList(),])
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.deepOrange,
                      child: Center(child: Text('My Teams')),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(child: Text('Firends')),
                    ),
                  ],
                ),
              ),
            ]))));
  }
}
