import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newproject/clean_code_tools/clean_code_tools.dart';
import 'package:newproject/domain/logic/domain_logic.dart';


class AddPetPage extends StatefulWidget {
  final void Function(
      String name,
      String breed,
      String date,
      String? description,
      String color,
      String? image,
      String type,
      String gender) onAdd;

  const AddPetPage({Key? key, required this.onAdd}) : super(key: key);

  @override
  AddPetPageState createState() => AddPetPageState();
}

class AddPetPageState extends State<AddPetPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _colorController = TextEditingController();
  final _typeController = TextEditingController();
  final _genderController = TextEditingController();
  final _imageController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text('New Pet', style: TextStyle(color: Colors.black)),
            Text(
              'Add page',
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
        child: Form(
          child: Column(
            key: _formKey,
            children: [
              Column(
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
                                labelText: "Name",
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
                                    () {
                                      _typeController.text = value;
                                    },
                                  );
                                },
                              ),
                              CustomDropDown(
                                items: genderMenuItems,
                                selectedValue: genderMenuItems[0],
                                controller: _genderController,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _genderController.text = value;
                                    },
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
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1.0,
                          height: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: AddFields(
                            breedController: _breedController,
                            dateController: _dateController,
                            colorController: _colorController,
                            descriptionController: _descriptionController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomElevatedButton(
                            text: 'Add Pet',
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('Pets').doc(_nameController.text)
                                  .set({
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
