import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PetModel {
  final String name;
  final String breed;
  final String? image;
  final String? description;

  PetModel(this.name, this.breed, {this.image, this.description});
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);
  static const String id = 'mainmenu';

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class AddPetDialog extends StatefulWidget {
  final void Function(String name, String breed) onAdd;

  const AddPetDialog({required this.onAdd});

  @override
  _AddPetDialogState createState() => _AddPetDialogState();
}

class _AddPetDialogState extends State<AddPetDialog> {
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Додати тварину'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Ім\'я',
              ),
            ),
            TextField(
              controller: _breedController,
              decoration: const InputDecoration(
                labelText: 'Порода',
              ),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: 'Посилання на зображення',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Опис',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Скасувати'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onAdd(_nameController.text, _breedController.text);
            Navigator.pop(context);
          },
          child: const Text('Додати'),
        ),
      ],
    );
  }
}

class EditPetScreen extends StatefulWidget {
  final PetModel pet;
  final void Function(String name, String breed, String? image, String? description) onSave;

  const EditPetScreen({required this.pet, required this.onSave});

  @override
  _EditPetScreenState createState() => _EditPetScreenState();
}

class _EditPetScreenState extends State<EditPetScreen> {
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _nameController.text = widget.pet.name;
    _breedController.text = widget.pet.breed;
    _imageController.text = widget.pet.image ?? '';
    _descriptionController.text = widget.pet.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редагувати тварину'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Ім\'я',
              ),
            ),
            TextField(
              controller: _breedController,
              decoration: const InputDecoration(
                labelText: 'Порода',
              ),
            ),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: 'Посилання на зображення',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Опис',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                  _nameController.text,
                  _breedController.text,
                  _imageController.text.isNotEmpty ? _imageController.text : null,
                  _descriptionController.text.isNotEmpty ? _descriptionController.text : null,
                );
                Navigator.pop(context);
              },
              child: const Text('Зберегти'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainMenuState extends State<MainMenu> {
  final List<PetModel> _pets = [];

  void _addPet() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddPetDialog(
          onAdd: (name, breed) {
            setState(() {
              _pets.add(PetModel(name, breed));
            });
          },
        );
      },
    );
  }

  void _editPet(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPetScreen(
          pet: _pets[index],
          onSave: (name, breed, image, description) {
            setState(() {
              _pets[index] = PetModel(name, breed, image: image, description: description);
            });
          },
        ),
      ),
    );
  }

  void _removePet(int index) {
    setState(() {
      _pets.removeAt(index);
    });
  }

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: signOut,
          child: const Icon(
            Icons.exit_to_app,color: Colors.black,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
             Text('Pet Log', style: TextStyle(color: Colors.black)),
            SizedBox(width: 6,),
            Icon(Icons.pets, color: Colors.black,size: 25,),
          ],
        ),
        backgroundColor: Color.fromRGBO(255,120,63,1),
        actions: [
          IconButton(
            onPressed: _addPet,
            icon: const Icon(Icons.add,color: Colors.black,size: 40,),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (BuildContext context, int index) {
          final pet = _pets[index];
          return ListTile(
            leading: pet.image != null
                ? Image.network(pet.image!)
                : const Icon(Icons.pets),
            title: Text(pet.name),
            subtitle: Text(pet.breed),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _editPet(index),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => _removePet(index),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}