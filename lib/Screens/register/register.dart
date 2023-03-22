import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/Screens/login/login.dart';
import 'package:newproject/Service/snack_bar.dart';

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
  final formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> signUp() async {
    final navigator = Navigator.of(context);



    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackBarService.showSnackBar(
          context,
          'This Email is already in use, try again with another Email',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Unknown error! Try again or contact support.',
          true,
        );
      }
    }

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  } /// SignInLogic

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

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
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
                    labelText:("Confirm password")
                ),
              ),
            ),/// ConfirmPasswordTextField

            SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(61, 224, 146, 1),
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
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                },
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