import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';
import 'package:newproject/domain/logic/domain_logic.dart';

class EditPetScreen extends StatefulWidget {
  final PetModel pet;
  final void Function(String name, String breed, String date, String color,
      String? image, String? description, String type, String gender) onSave;

  const EditPetScreen({super.key, required this.pet, required this.onSave});

  @override
  EditPetScreenState createState() => EditPetScreenState();
}

class EditPetScreenState extends State<EditPetScreen> {
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _dateController = TextEditingController();
  final _colorController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _typeController = TextEditingController();
  final _genderController = TextEditingController();

  @override
  void dispose() {
    _typeController.dispose();
    _genderController.dispose();
    _imageController.dispose();
    _colorController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    _nameController.dispose();
    _breedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference _reference=FirebaseFirestore.instance.collection('Pets');
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(_nameController.text,
                style: const TextStyle(color: Colors.black)),
            const Text(
              'Edit page',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: colorApp,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Stack(
                    children: [
                      Image.asset('assets/images/pngegg.png'),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Ім\'я',
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        CustomDropDown(
                          items: typeMenuItems,
                          selectedValue: typeMenuItems[0],
                          controller: _typeController,
                          onChanged: (value) {
                            setState(
                              () {},
                            );
                          },
                        ),
                        CustomDropDown(
                          items: genderMenuItems,
                          selectedValue: genderMenuItems[0],
                          controller: _genderController,
                          onChanged: (value) {
                            setState(
                              () {},
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'Main information',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Breed',
                          controller: _breedController,
                          prefixIcon: Icons.pets_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          labelText: 'Date',
                          controller: _dateController,
                          prefixIcon: Icons.calendar_month_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          labelText: 'Color',
                          controller: _colorController,
                          prefixIcon: Icons.color_lens_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        CustomTextFormField(
                          labelText: 'Description',
                          controller: _descriptionController,
                          prefixIcon: Icons.comment_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('Pets')
                    .doc(_nameController.text)
                    .update({
                  'name': _nameController.text,
                  'breed': _breedController.text,
                  'color': _colorController.text,
                  'date': _dateController.text,
                  'description': _descriptionController.text,
                  'type': _typeController.text,
                  'gender': _genderController.text,
                });
                Navigator.pop(context);
              },
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
