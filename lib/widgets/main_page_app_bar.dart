import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject/domain/logic/domain_logic.dart';
import 'package:newproject/domain/screens/domain_screens.dart';
import '../clean_code_tools/clean_code_tools.dart';


class MainPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MainPageAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () async {
          await PetMethods.signOut(context);
        },
        child: const Icon(
          Icons.exit_to_app,
          color: Colors.black,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Pet Log', style: TextStyle(color: Colors.black)),
          SizedBox(
            width: 6,
          ),
          Icon(
            Icons.pets,
            color: Colors.black,
            size: 25,
          ),
        ],
      ),
      backgroundColor: colorApp,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPetPage(
                  onAdd: (name, breed, color, date, description, image, type,
                      gender) {
                    FirebaseFirestore.instance.collection('Pets').doc();
                  },
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 40,
          ),
        ),
      ],
    );
  }
}
