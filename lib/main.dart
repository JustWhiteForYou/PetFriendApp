import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/Main/mainmenu.dart';
import 'package:newproject/Navigation/Navigation.dart';
import 'package:newproject/Pages/welcome_screen.dart';
import 'package:newproject/navbar.dart';
import 'Screens/login/login.dart';
import 'Screens/register/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:newproject/Service/firebase_stream.dart';
import 'package:newproject/Screens/VerifyEmail/verify_email.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const FirebaseStream(),
        '/main': (context) => const MainMenu(),
        '/login': (context) =>  LoginScreen(),
        '/signup': (context) =>  RegisterScreen(),
        '/verify_email': (context) => const VerifyEmailScreen(),
        '/navigation': (context) =>  Navigate()
      },
      initialRoute: '/',
    );
  }
}
