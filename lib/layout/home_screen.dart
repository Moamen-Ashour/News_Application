import 'dart:async';

import 'package:coach_nearest/generated/assets.dart';
import 'package:coach_nearest/models/category_item.dart';
import 'package:coach_nearest/screens/drawer_scr.dart';
import 'package:coach_nearest/screens/home_screen.dart';
import 'package:coach_nearest/shared/providers/appbar_icon_search.dart';
import 'package:coach_nearest/shared/providers/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var search_Icon = Provider.of<search_icon>(context);
    var appbar_titl = Provider.of<appbar_title>(context);
    Widget appBarTitle = Text(appbar_titl.changeTitle("Settings"));

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(Assets.imagesPattern2), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xff5f967c),
            title:
                Consumer<appbar_title>(builder: (context, appbartitle, child) {
              if (this.number == 0) {
                return Text(appbartitle.changeTitle("Home"));
              } else if (this.number == 1 &&
                  search_Icon.iconSearch.icon == Icons.search) {
                return appBarTitle;
              } else if (this.number == 1 &&
                  search_Icon.iconSearch.icon == Icons.close) {
                return appBarTitle = TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        )));
              } else {
                return Text(appbartitle.changeTitle("Home"));
              }
            }),
            // leading: Lottie.asset(Assets.jsonLottieReading),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  // child:
                  child: IconButton(
                      onPressed: () {
                        if (search_Icon.iconSearch.icon == Icons.search) {
                          search_Icon.changeIcon(Icon(Icons.close));
                        } else if (search_Icon.iconSearch.icon !=
                            Icons.search) {
                          search_Icon.changeIcon(Icon(Icons.search));
                        }
                      },
                      icon: search_Icon.iconSearch))
            ],
            centerTitle: true,
            elevation: 0.0,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
          ),
          drawer: drawer_scr(onDraweScreen),
          body: number == 0
              ? categoryData == null
                  ? category_screen(onCategorySelected)
                  : home_screen(categoryData!)
              : settings_screen()),
    );
  }

  int number = 0;
  CategoryData? categoryData = null;

  void onDraweScreen(number) {
    if (this.number == drawer_scr.Cateogry) {
      categoryData = null;
      this.number = 1;
    } else if (this.number == drawer_scr.Setting) {
      this.number = 0;
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    setState(() {});
  }
}
