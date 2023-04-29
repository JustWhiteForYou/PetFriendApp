import 'package:flutter/material.dart';
import 'package:newproject/data/auth/screens/login.dart';
import 'package:newproject/domain/screens/domain_screens.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 120, 63, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.pop(MainPage() as BuildContext),
              child: const Icon(Icons.arrow_left, color: Colors.white, size: 40)),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              child: const Icon(Icons.account_balance, color: Colors.white)),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, MainPage.id),
              child: const Icon(Icons.sync, color: Colors.white)),
          // ElevatedButton(
          //     onPressed: () => Navigator.pushNamed(context, AccountScreen.id),
          //     child: Icon(Icons.account_circle, color: Colors.white)),
        ],
      ),
    );
  }
}