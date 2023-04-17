import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/constants.dart';
import 'package:newproject/data/auth/logic/login_logic.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'registerscreen';
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool isHiddenPassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =TextEditingController();

  @override
  void dispose(){
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
    Size size = MediaQuery.of(context).size;
    var signUp = Provider.of<AuthNotifier>(context,listen:false).signUp(
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
                    mySizedBox,
                    Text('PetLog',
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
                    labelText: "email",
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
                    labelText:("password"),
                ),
              ),
            ),/// PasswordTextField

            mySizedBox,

            Container(
              alignment: Alignment.center,
              margin: myEdgeIns,
              child:  TextFormField(
                controller: passwordRepeatController,
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
                    labelText:("Confirm password"),
                ),
              ),
            ),/// ConfirmPasswordTextField

            mySizedBox,

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () => signUp,
                style: ElevatedButton.styleFrom(
                    backgroundColor: mainColorOfButtons,
                    padding: const EdgeInsets.all(0)
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ), ///SignUpButton

            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {Navigator.pushReplacementNamed(context, '/login')},
                child: const Text(
                  "Already Have an Account? Sign in",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                  ),
                ),
              ),
            ) ///BackToLoginButton
          ],
        ),
      );
  }
}

