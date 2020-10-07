import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'book.dart';

class BookListModel extends ChangeNotifier {
  List<Book> books = [];
  Future fetchBooks() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final docs =
        await FirebaseFirestore.instance.collection('books').getDocuments();
    final books = docs.documents.map((doc) => Book(doc['title'])).toList();
    this.books = books;
    notifyListeners();
  }
}
