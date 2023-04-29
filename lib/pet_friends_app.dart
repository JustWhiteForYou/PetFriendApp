import 'package:flutter/material.dart';
import 'package:newproject/presentation/navigation/routes.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';

class PetFriendsApp extends StatelessWidget {
  const PetFriendsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myAppThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/enter',
      routes: routes,
    );
  }
}
