import 'package:flutter/material.dart';
import 'package:newproject/Main/mainmenu.dart';
import 'package:newproject/Pages/welcome_screen.dart';
import 'Screens/login/login.dart';
import 'package:newproject/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DemoDemoDemo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MainMenu.id: (context) => MainMenu(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
