import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newproject/data/auth/logic/auth_logic.dart';
import 'package:newproject/pet_friends_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthNotifier()),
    ], child: const PetFriendsApp()),
  );
}
