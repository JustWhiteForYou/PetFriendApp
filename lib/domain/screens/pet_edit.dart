import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject/domain/logic/domain_logic.dart';
import 'package:newproject/domain/screens/domain_screens.dart';
import 'package:newproject/widgets/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String id = 'mainmenu';


  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {


  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _colorController = TextEditingController();
  final _typeController = TextEditingController();
  final _genderController = TextEditingController();

  void _editPet(int index, AsyncSnapshot snapshot) {
    FirebaseFirestore.instance
        .collection('Pets')
        .doc(snapshot.data.docs[index].id)
        .update({
      'name': _nameController.text,
      'breed': _breedController.text,
      'color': _colorController.text,
      'date': _dateController.text,
      'description': _descriptionController.text,
      'type': _typeController.text,
      'gender': _genderController.text,
    });
  }

  void _removePet(int index, AsyncSnapshot snapshot){
    setState(() {
      PetMethods.removePet(index, snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainPageAppBar(),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection('Pets').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: Text('Cant find information in database'));
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  key: Key(snapshot.data.docs[index].id),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Row(
                      children: [
                        const Icon(Icons.badge_outlined),
                        Text(snapshot.data.docs[index].get('name')),
                      ],
                    ),
                    subtitle: Text(snapshot.data.docs[index].get('breed')),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPetScreen(
                                  pet: PetModel(
                                    id: 'id',
                                    name: snapshot.data.docs[index].get('name'),
                                    breed: snapshot.data.docs[index].get('breed'),
                                    color: snapshot.data.docs[index].get('color'),
                                    date: snapshot.data.docs[index].get('date'),
                                    description: snapshot.data.docs[index].get('description'),
                                    type: snapshot.data.docs[index].get('type'),
                                    gender: snapshot.data.docs[index].get('gender'),
                                  ),
                                  onSave: (String name, String breed, String date, String color,
                                      String? image, String? description, String type, String gender) {
                                  },
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _removePet(index, snapshot),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigator.pushNamed(context, '/navigate');
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
