import 'package:firebase_auth/firebase_auth.dart';

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