import 'package:flutter/material.dart';
import 'package:newproject/Main/mainmenu.dart';
import 'package:newproject/Screens/register/register.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:newproject/Service/snack_bar.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'loginscreen';
  const LoginScreen({super.key});

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
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);



    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      print(error.code);

      if (error.code == 'user-not-found' || error.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Wrong email or password. Try again',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
        return;
      }
    }
    navigator.pushNamedAndRemoveUntil('/main', (Route<dynamic> route) => false);
  } /// LoginLogic

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Icon(Icons.pets,color: Color.fromRGBO(255, 120, 63, 1),size: 120,),
                  SizedBox(width: 10),
                  Text(
                    'PetLog',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                        fontSize: 50),
                  textAlign: TextAlign.left
                  ),
                ],
              )
            ),/// MainAppLog

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child:  TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (email) => email
                    != null && !EmailValidator.validate(email)
                    ? 'Wrong type of email'
                    :null,
                decoration: const InputDecoration(
                  labelText: "email"
                ),
              ),
            ),/// EmailTextField

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child:  TextFormField(
                controller: passwordController,
                obscureText: isHiddenPassword,
                validator: (value) => value
                    != null && value.length <6
                    ?'Min 6 symbols'
                    :null,
                decoration:  InputDecoration(
                  suffix: InkWell(
                    onTap: togglePasswordView,
                    child: Icon(
                        isHiddenPassword
                          ?Icons.visibility_off
                          :Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                  labelText:("password")
                ),
              ),
            ),/// PasswordTextField

            SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child:Column(
                children: <Widget> [
                  ElevatedButton(
                    onPressed: () {
                      login();
                      },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(61, 224, 146, 1),
                      padding: const EdgeInsets.all(0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      child: const Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),

                  const Text('Or'),

                  const SizedBox(height: 10,),

                  SignInButton(
                      Buttons.Google,
                      onPressed: (){},
                  ),
                ],
              )
            ),/// Login Buttons

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(60,227,148,1)
                  ),
                ),
              ),
            ), /// SignIn Button
          ],
        ),
      );
  }
}