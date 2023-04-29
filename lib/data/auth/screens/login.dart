import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';
import 'package:newproject/data/auth/logic/auth_logic.dart';
import 'package:newproject/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isHiddenPassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logIn = Provider.of<AuthNotifier>(context, listen: false)
        .logIn(context, emailController, passwordController);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const MainPetLog(),

          /// MainAppLog

          mySizedBox,

          TextFieldEmailForm(emailController: emailController),

          /// EmailTextField

          mySizedBox,

          PasswordTextField(
            passwordController: passwordController,
            isHiddenPassword: isHiddenPassword,
            togglePasswordView: (value) => setState(() => isHiddenPassword = value),
          ),

          /// PasswordTextField

          mySizedBox,

          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: <Widget>[
                  CustomElevatedButton(
                    onPressed: () => logIn, // This line might be the issue
                    text: 'Login',
                  ),
                  mySizedBox,
                  const Text('Or'),
                  mySizedBox,
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                  ),
                ],
              )),

          /// Login Buttons

          Container(
            alignment: Alignment.center,
            margin: myEdgeIns,
            child: GestureDetector(
              onTap: () => {Navigator.pushReplacementNamed(context, '/signup')},
              child: const Text(
                "Sign up",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: mainColorOfButtons),
              ),
            ),
          ),

          /// SignIn Button
        ],
      ),
    );
  }
}
