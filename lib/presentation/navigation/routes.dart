import 'package:flutter/material.dart';
import 'package:newproject/data/auth/screens/auth_screens.dart';
import 'package:newproject/data/fire_service/firebase_stream.dart';
import 'package:newproject/domain/screens/domain_screens.dart';
import 'package:newproject/presentation/screens/enter_screen.dart';
import 'package:newproject/presentation/navigation/navigation.dart';

final routes = {
  '/': (BuildContext context) => const FirebaseStream(),
  '/main': (BuildContext context) => const MainPage(),
  '/login': (BuildContext context) => const LoginScreen(),
  '/signup': (BuildContext context) => const SignUpScreen(),
  '/verify_email': (BuildContext context) => const VerifyEmailScreen(),
  '/navigate': (context) => const Navigate(),
  '/enter': (context) => const EnterScreen(),
};
