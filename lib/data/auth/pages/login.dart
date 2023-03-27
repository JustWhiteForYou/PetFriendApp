import 'package:flutter/material.dart';
import 'package:newproject/constants.dart';
import 'package:newproject/data/auth/logic/login_logic.dart';
import 'package:newproject/data/auth/pages/register.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var logIn = Provider.of<LogInLogic>(context,listen: false).logIn(
        context, emailController, passwordController);


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: myEdgeIns,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Icon(Icons.pets,color: colorApp,size: 120,),
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

            mySizedBox,

            Container(
              alignment: Alignment.center,
              margin: myEdgeIns,
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

            mySizedBox,

            Container(
              alignment: Alignment.center,
              margin: myEdgeIns,
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

            mySizedBox,

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child:Column(
                children: <Widget> [
                  ElevatedButton(
                    onPressed: () => logIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColorOfButtons,
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
                  mySizedBox,

                  const Text('Or'),

                  mySizedBox,

                  SignInButton(
                      Buttons.Google,
                      onPressed: (){},
                  ),
                ],
              )
            ),/// Login Buttons

            Container(
              alignment: Alignment.center,
              margin: myEdgeIns,
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
                    color: mainColorOfButtons
                  ),
                ),
              ),
            ), /// SignIn Button
          ],
        ),
      );
  }
}