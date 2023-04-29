import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PetMethods {
  static Future<void> signOut(BuildContext context) async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  static void removePet(int index, AsyncSnapshot snapshot) {
    {
      FirebaseFirestore.instance
          .collection('Pets')
          .doc(snapshot.data.docs[index].id)
          .delete();
    }
  }
}
