
import 'package:coach_nearest/generated/assets.dart';
import 'package:coach_nearest/models/category_item.dart';
import 'package:coach_nearest/screens/Drawer_screen.dart';
import 'package:coach_nearest/models/json_api_sources/sources_api.dart';
import 'package:coach_nearest/netwrork/remote/api_manager.dart';
import 'package:coach_nearest/screens/drawer_scr.dart';
import 'package:coach_nearest/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:lottie/lottie.dart';

import '../screens/category_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/tab_controller.dart';


class Home_Screen extends StatefulWidget {

  static const String routeName = "Home_Screen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
          image: DecorationImage(image: AssetImage(Assets.imagesPattern2),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xff5f967c),
          title: Text("News Application"),
         // leading: Lottie.asset(Assets.jsonLottieReading),
          centerTitle: true,
          elevation: 0.0,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
          ),
        ),
        drawer: drawer_scr(onDraweScreen),
        body: number==0?categoryData==null?category_screen(onCategorySelected):home_screen(categoryData!):settings_screen()

      ),
    );
  }

int number =0;
  CategoryData? categoryData=null;

  void onDraweScreen(number){
    if(this.number == drawer_scr.Screens[0]){
       categoryData=null;
       this.number = 1;
    }else if(this.number == drawer_scr.Screens[1]){
      this.number=0;
    }
    setState(() {
            Navigator.pop(context);
    });
  }

  void onCategorySelected(categorySelected){
    categoryData = categorySelected;
    setState(() {

    });
  }
}
