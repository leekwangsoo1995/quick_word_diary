import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier{
  String LeeText = 'Leeee';

    void changeLeeText(){
      LeeText = 'Leeさんsan';
      notifyListeners();
    }
}