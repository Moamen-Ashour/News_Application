

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../generated/assets.dart';
import '../shared/styles/colors/colors.dart';

class CategoryData{
  String id;
  String title;
  String image;
  Color color;

  CategoryData(this.id, this.title, this.image, this.color);

  static List<CategoryData> getCategories(BuildContext context){
    return[
      CategoryData("sports", AppLocalizations.of(context)!.sports, Assets.imagesBall, Color_red),
      CategoryData("business", AppLocalizations.of(context)!.bussines, Assets.imagesBussines, Color_Orange),
      CategoryData("entertainment", AppLocalizations.of(context)!.entertainment, Assets.imagesEnvironment, Color_Blue),
      CategoryData("general", AppLocalizations.of(context)!.general, Assets.imagesPolitics, Color_LightBlue),
      CategoryData("health", AppLocalizations.of(context)!.health, Assets.imagesHealth, Color_Pink),
      CategoryData("science", AppLocalizations.of(context)!.science, Assets.imagesScience, Color_Yellow),
      CategoryData("technology", AppLocalizations.of(context)!.technology, Assets.imagesEnvironment, Color_red),
      CategoryData("general", AppLocalizations.of(context)!.games, Assets.imagesBall, Color_Orange),
    ];
  }



}