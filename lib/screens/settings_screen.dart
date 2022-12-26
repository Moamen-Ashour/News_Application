import 'dart:convert';

import 'package:coach_nearest/main.dart';
import 'package:coach_nearest/shared/translate_assets/language.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class settings_screen extends StatelessWidget {
  static const String routeName = "Setting";
   static String lang = "";

  // Function updateLanguage;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        underline: SizedBox(),
        icon: Icon(
          Icons.language,
          color: Colors.white,
        ),
        onChanged: (Language? language) {
          if(language != null){
            MyApp.setLocale(context, Locale(language.languageCode,""));
            settings_screen.lang = language.languageCode;
          }
        },
        items: Language.languageList()
            .map<DropdownMenuItem<Language>>(
              (e) => DropdownMenuItem<Language>(
                value: e,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      e.flag,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(e.name)
                  ],
                ),
              ),
            )
            .toList());
  }
}
