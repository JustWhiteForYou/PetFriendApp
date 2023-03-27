import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/presentation/notifications/snack_bar.dart';

extension FirebaseAuthExceptionExtensions on FirebaseAuthException {
  bool isWrongCredentials() {
    return this.code == 'user-not-found' || this.code == 'wrong-password';
  }
}

enum AuthErrorCode {
  emailAlreadyInUse,
  wrongCredentials,
  unknown,
}

extension AuthErrorCodeExtension on AuthErrorCode {
  String get name {
    switch (this) {
      case AuthErrorCode.emailAlreadyInUse:
        return 'This Email is already in use, try again with another Email';
      case AuthErrorCode.wrongCredentials:
        return 'Wrong email or password. Try again';
      case AuthErrorCode.unknown:
        return 'Unknown error! Try again or contact support.';
      default:
        return '';
    }
  }

  static AuthErrorCode fromFirebaseException(FirebaseAuthException firebaseException) {
    switch (firebaseException.code) {
      case 'email-already-in-use':
        return AuthErrorCode.emailAlreadyInUse;
      case 'user-not-found':
      case 'wrong-password':
        return AuthErrorCode.wrongCredentials;
      default:
        return AuthErrorCode.unknown;
    }
  }
}

class LogInLogic extends ChangeNotifier {
   Future<void> logIn(
      final BuildContext context,
      final TextEditingController emailController,
      final TextEditingController passwordController)

  async {
    final navigator = Navigator.of(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      print(error.code);

      final errorCode = AuthErrorCodeExtension.fromFirebaseException(error);
      if (errorCode == AuthErrorCode.wrongCredentials ||
          errorCode == AuthErrorCode.emailAlreadyInUse) {
        SnackBarService.showSnackBar(
          context: context,
          message: errorCode.name,
          error: true,
        );
      } else {
        SnackBarService.showSnackBar(
          context: context,
          message: AuthErrorCode.unknown.name,
          error: true,
        );
      }
      return;
    }

    navigator.pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
  }
}

