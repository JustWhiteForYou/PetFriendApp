import 'package:flutter/material.dart';
import 'package:newproject/presentation/Navigation/navbar.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Pet Log', style: TextStyle(color: Colors.black)),
            SizedBox(width: 6,),
            Icon(Icons.pets, color: Colors.black,size: 25,),
          ],
        ),
        backgroundColor: Color.fromRGBO(255,120,63,1),
      ),
      body: Center(
        child: Text('PETLOG'),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}