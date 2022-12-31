import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Language{

  final int id;
  final String flag;
  final String name;
  final  String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static String arabic = "arabic";
  static String english = "english";


  static List<Language> languageList(BuildContext context){
    return <Language>  [
      Language(1, "🇪🇬", AppLocalizations.of(context)!.arabic, "ar"),
      Language(2, "🇺🇸", AppLocalizations.of(context)!.english, "en")
    ];
  }

}