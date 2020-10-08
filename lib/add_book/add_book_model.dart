import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  Future addBookToFireStore() async {
    if (bookTitle.isEmpty) {
      throw ('title is empty');
    }
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Firestore.instance.collection('books').add({
      'title': bookTitle,
    });
    notifyListeners();
  }
}
