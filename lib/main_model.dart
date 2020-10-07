import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String kboyText = 'KBOY';

  void changeKboyText() {
    kboyText = 'kboyさんかっこいい！！！';
    notifyListeners();
  }
}
