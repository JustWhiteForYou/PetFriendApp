import 'package:flutter/material.dart';
import '../clean_code_tools/clean_code_tools.dart';

class MainPetLog extends StatelessWidget {
  const MainPetLog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: myEdgeIns,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.pets,
              color: colorApp,
              size: 120,
            ),
            mySizedBox,
            Text('PetLog',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
                textAlign: TextAlign.left),
          ],
        ));
  }
}
