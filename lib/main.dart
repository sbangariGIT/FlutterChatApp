import 'package:app/Screens/wrapper.dart';
import 'package:app/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/auth.dart';
import 'authentication/user.dart';
import 'authentication/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
