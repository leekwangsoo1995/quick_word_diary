import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
//    documentId = doc.documentId;
    //ここちょっと違う可能性ある
    //ここちょっと違う可能性ある
    //ここちょっと違う可能性ある
    documentId = doc['documentId'];
    title = doc['title'];
  }
  String documentId;
  String title;
}
