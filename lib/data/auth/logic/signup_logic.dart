import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/data/auth/logic/login_logic.dart';
import 'package:newproject/presentation/notifications/snack_bar.dart';

class SignUpLogic {

  static Future<void> signUp(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController)

  async {
    final navigator = Navigator.of(context);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      print(error.code);

      final errorCode = AuthErrorCodeExtension.fromFirebaseException(error);
      if (error.code == AuthErrorCode.emailAlreadyInUse ||
          error.code == AuthErrorCode.wrongCredentials) {
        SnackBarService.showSnackBar(
          context:context,
          message: errorCode.message,
          error: true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context:context,
          message:AuthErrorCode.unknown.message,
          error: true,
        );
      }
    }
    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }
} /// SignInLogic}

