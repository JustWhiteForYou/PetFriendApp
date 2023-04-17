import 'package:flutter/material.dart';
import 'package:newproject/data/auth/pages/login.dart';
import 'package:newproject/data/auth/pages/register.dart';
import 'package:newproject/data/auth/pages/verify_email.dart';
import 'package:newproject/data/fire_service/firebase_stream.dart';
import 'package:newproject/domain/pet_edit.dart';

final routes= {
  '/': (BuildContext context) => FirebaseStream(),
  '/main': (BuildContext context) => MainMenu(),
  '/login': (BuildContext context) => LoginScreen(),
  '/signup': (BuildContext context) => RegisterScreen(),
  '/verify_email': (BuildContext context) => VerifyEmailScreen(),
};
