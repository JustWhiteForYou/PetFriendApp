// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:newproject/data/auth/logic/login_logic.dart';
// import 'package:newproject/presentation/notifications/snack_bar.dart';
//
// class SignUpLogic extends ChangeNotifier{
//
//    Future<void> signUp(
//       final BuildContext context,
//       final TextEditingController emailController,
//       final TextEditingController passwordController)
//
//   async {
//     final navigator = Navigator.of(context);
//
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//     } on FirebaseAuthException catch (error) {
//       print(error.code);
//
//       final errorCode = AuthErrorCodeExtension.fromFirebaseException(error);
//       if (error.code == AuthErrorCode.emailAlreadyInUse ||
//           error.code == AuthErrorCode.wrongCredentials) {
//         SnackBarService.showSnackBar(
//           context:context,
//           message: errorCode.name,
//           error: true,
//         );
//         return;
//       } else {
//         SnackBarService.showSnackBar(
//           context:context,
//           message:AuthErrorCode.unknown.name,
//           error: true,
//         );
//       }
//     }
//     navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
//   }
// } /// SignInLogic}
//
