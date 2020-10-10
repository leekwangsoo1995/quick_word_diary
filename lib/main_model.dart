import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String kboyText = 'ようこそ';

  void changeKboyText() {
    kboyText = 'kboyさんかっこいい！！！';
    notifyListeners();
  }
}
