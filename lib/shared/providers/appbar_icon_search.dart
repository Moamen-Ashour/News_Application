


import 'package:flutter/material.dart';

class search_icon extends ChangeNotifier{


 static Icon iconSearch = Icon(Icons.search);


  changeIcon(Icon icon){
      iconSearch = icon;
      notifyListeners();
      }

    }

