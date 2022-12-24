import 'package:coach_nearest/models/category_item.dart';
import 'package:coach_nearest/screens/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import '../models/json_api_sources/sources_api.dart';
import 'package:coach_nearest/models/json_api_sources/sources_api.dart';
import 'package:coach_nearest/netwrork/remote/api_manager.dart';


class home_screen extends StatelessWidget {

  CategoryData categoryData;


  home_screen(this.categoryData);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourcesApi>(
        future: api_manager.getDataFromAPI(categoryData.id),
        builder: ( context, snapshot) {
          var sources = snapshot.data?.sources;
          if (snapshot.hasData) {
            return tab_controller(sources!);

          } else if (snapshot.hasError) {
            return Center(child: Lottie.asset(Assets.jsonLottieError));
          } else {
            return Center(child: Container(

                child: Lottie.asset(Assets.jsonLottieEarth)));
          }
        }
        );
  }
}
