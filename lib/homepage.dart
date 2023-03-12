import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Main Menu')),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(
                Icons.add,
                size: 40,
                color: Color.fromRGBO(255, 255, 255, 1),
          ))
        ],
      ),
      body: const Center(
        child: Text('PetLog'),
      ),
    );
  }
}
