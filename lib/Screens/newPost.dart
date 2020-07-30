import 'package:app/authentication/animation.dart';
import 'package:app/database.dart';
import 'package:flutter/material.dart';

class newPost extends StatefulWidget {
  @override
  _newPostState createState() => _newPostState();
}

class _newPostState extends State<newPost> {
  final formkeys = GlobalKey<FormState>();
  TextEditingController sportTextEditingController =
      new TextEditingController();
  TextEditingController dateTextEditingController = new TextEditingController();
  TextEditingController purposeTextEditingController =
      new TextEditingController();
  DatabaseMethods db = DatabaseMethods();
  sendPost() {
    if (formkeys.currentState.validate()) {
      Map<String, dynamic> feedPost = {
        "Date": dateTextEditingController.text,
        "Purpose": purposeTextEditingController.text,
        "sportName": sportTextEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch
      };
      db.addToFeed(feedPost);

      setState(() {
        sportTextEditingController.text = "";
        dateTextEditingController.text = "";
        purposeTextEditingController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange[900],
          Colors.orange[800],
          Colors.orange[400]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Add Post",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Game On!",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Form(
                                    key: formkeys,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[200]))),
                                          child: TextFormField(
                                            controller:
                                                sportTextEditingController,
                                            validator: (val) {
                                              return val.isEmpty
                                                  ? "Please enter a valid Sport"
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: "Sport Name",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[200]))),
                                          child: TextFormField(
                                            controller:
                                                dateTextEditingController,
                                            validator: (val) {
                                              return val.isEmpty
                                                  ? "Please Enter Correct Date"
                                                  : null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: "Date",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color:
                                                          Colors.grey[200]))),
                                          child: TextFormField(
                                            controller:
                                                purposeTextEditingController,
                                            validator: (val) {
                                              return val.length > 6
                                                  ? null
                                                  : "Enter Purpose";
                                            },
                                            decoration: InputDecoration(
                                                hintText: "Purpose",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.6,
                            GestureDetector(
                                onTap: () {
                                  sendPost(); //send to database;
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange[900]),
                                  child: Center(
                                    child: Text(
                                      "Add Post",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
