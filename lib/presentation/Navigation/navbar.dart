import 'package:flutter/material.dart';
import 'package:newproject/data/auth/login.dart';
import 'package:newproject/domain/pet_edit.dart';
import 'package:newproject/presentation/Pages/welcome_screen.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 120, 63, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.pop(WelcomeScreen() as BuildContext),
              child: Icon(Icons.arrow_left, color: Colors.white, size: 40)),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              child: Icon(Icons.account_balance, color: Colors.white)),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, MainMenu.id),
              child: Icon(Icons.sync, color: Colors.white)),
          // ElevatedButton(
          //     onPressed: () => Navigator.pushNamed(context, AccountScreen.id),
          //     child: Icon(Icons.account_circle, color: Colors.white)),
        ],
      ),
    );
  }
}