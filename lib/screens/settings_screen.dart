import 'dart:convert';

import 'package:coach_nearest/main.dart';
import 'package:coach_nearest/shared/translate_assets/language.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class settings_screen extends StatelessWidget {
  static const String routeName = "Setting";
   static String lang = "";
  Language? language;

  // Function updateLanguage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(5),right: Radius.circular(5)),
                    border: Border.all(
                        width: 5,
                        color: Colors.black12
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.language,style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.white,
                          Colors.green,

                          //add more colors
                        ]),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5)
                    ]
                ),
                child: DropdownButton(
                  value: language,
                    underline: SizedBox(),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    onChanged: (Language? language) {
                      if(language != null){
                        MyApp.setLocale(context, Locale(language.languageCode,""));
                        settings_screen.lang = language.languageCode;
                      }
                    },
                    items: Language.languageList(context)
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
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
