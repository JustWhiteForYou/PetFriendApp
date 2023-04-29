import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  String id;
  String name;
  String breed;
  String color;
  String type;
  String date;
  String gender;
  String? image;
  String? description;

  PetModel({
    required this.id,
    required this.name,
    required this.breed,
    required this.color,
    required this.type,
    required this.date,
    required this.gender,
    this.image,
    this.description,
  });

  factory PetModel.fromSnapshot(DocumentSnapshot snapshot) {
    return PetModel(
      id: snapshot.id,
      name: snapshot.get('name'),
      breed: snapshot.get('breed'),
      color: snapshot.get('color'),
      type: snapshot.get('type'),
      gender: snapshot.get('gender'),
      date: snapshot.get('date'),
      image: snapshot.get('image'),
      description: snapshot.get('description'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'breed': breed,
        'color': color,
        'type': type,
        'date': date,
        'gender': gender,
        'image': image,
        'description': description,
        if (image != null) 'image': image,
        if (description != null) 'description': description,
      };
}
