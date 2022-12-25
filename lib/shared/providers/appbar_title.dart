

import 'package:flutter/material.dart';

class appbar_title extends ChangeNotifier{

  var text = "Home";

 String changeTitle(title){
    text = title;
    notifyListeners();
    return text;

  }
}