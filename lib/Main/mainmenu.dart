import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class Pet {
  final String name;
  final String breed;

  Pet(this.name, this.breed);
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Додати тварину'),
      content: Column(
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
        ],
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

class _MainMenuState extends State<MainMenu> {
  final List<Pet> _pets = [];

  void _addPet() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddPetDialog(
          onAdd: (name, breed) {
            setState(() {
              _pets.add(Pet(name, breed));
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pet Log', style: TextStyle(color: Colors.black)),
            SizedBox(width: 6,),
            Icon(Icons.pets, color: Colors.black,size: 25,),
          ],
        ),
        backgroundColor: Color.fromRGBO(255,120,63,1),
      ),

      body: ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          final pet = _pets[index];
          return ListTile(
            title: Text(pet.name),
            subtitle: Text(pet.breed),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPet,
        tooltip: 'Додати тварину',
        child: const Icon(Icons.add),
      ),
    );
  }
}
