import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/data/auth/pages/verify_email.dart';
import 'package:newproject/data/auth/pages/login.dart';

class FirebaseStream extends StatelessWidget {
  const FirebaseStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
              body: Center(child: Text('Oh Error!!!')));
        } else if (snapshot.hasData) {
          if (!snapshot.data!.emailVerified) {
            return  VerifyEmailScreen();
          }
          return LoginScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}