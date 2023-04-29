import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/domain/logic/pet_methods.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter Screen'),
          leading: GestureDetector(
            onTap: () async {
              await PetMethods.signOut(context);
            },
            child: const Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (user == null) {
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    Navigator.pushReplacementNamed(context, '/main');
                  }
                },
                icon: const Icon(Icons.person),
            color: (user == null) ? Colors.white : Colors.orange,
            )
          ],
        ),
        body: Center(
          child: (user == null) 
          ? const Text('Null')
          : const Text('NotNull'),
        ));
  }
}
