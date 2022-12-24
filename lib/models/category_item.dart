

import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../shared/styles/colors/colors.dart';

class CategoryData{
  String id;
  String title;
  String image;
  Color color;

  CategoryData(this.id, this.title, this.image, this.color);

  static List<CategoryData> getCategories(){
    return[
      CategoryData("sports", "Sports", Assets.imagesBall, Color_red),
      CategoryData("business", "Bussines", Assets.imagesBussines, Color_Orange),
      CategoryData("entertainment", "Entertainment", Assets.imagesEnvironment, Color_Blue),
      CategoryData("general", "General", Assets.imagesPolitics, Color_LightBlue),
      CategoryData("health", "Health", Assets.imagesHealth, Color_Pink),
      CategoryData("science", "Science", Assets.imagesScience, Color_Yellow),
      CategoryData("technology", "Technology", Assets.imagesEnvironment, Color_red),
      CategoryData("general", "Games", Assets.imagesBall, Color_Orange),
    ];
  }



}