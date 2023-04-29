import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';
import 'package:newproject/data/auth/logic/auth_logic.dart';
import 'package:newproject/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = '/signup';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isHiddenPassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final signUp = Provider.of<AuthNotifier>(context, listen: false).signUp(
        context, emailController, passwordController, passwordRepeatController);

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
            margin: myEdgeIns,
            child: TextFormField(
              controller: passwordRepeatController,
              obscureText: isHiddenPassword,
              validator: (value) =>
                  value != null && value.length < 6 ? 'Min 6 symbols' : null,
              decoration: InputDecoration(
                suffix: InkWell(
                  onTap: togglePasswordView,
                  child: Icon(
                    isHiddenPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                ),
                labelText: ("confirm password"),
              ),
            ),
          ),

          /// ConfirmPasswordTextField

          mySizedBox,

          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: CustomElevatedButton(
              onPressed: () => signUp,
              text: 'Sign Up',
            ),
          ),

          ///SignUpButton

          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: CustomElevatedButton(
              onPressed: () =>
                  {Navigator.pushReplacementNamed(context, '/login')},
              text: 'I already have account',
            ),
          )

          ///BackToLoginButton
        ],
      ),
    );
  }
}
