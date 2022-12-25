


import 'package:flutter/material.dart';

class search_icon extends ChangeNotifier{


  Icon iconSearch = Icon(Icons.search);


  changeIcon(Icon icon){
      iconSearch = icon;
      notifyListeners();
      }

    }

