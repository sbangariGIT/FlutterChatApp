import 'package:app/authentication/login_screen.dart';
import 'package:app/authentication/user.dart';
import 'package:app/navigation/display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return login();
    } else {
      return display();
    }
  }
}
