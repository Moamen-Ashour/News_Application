import 'package:coach_nearest/main.dart';
import 'package:coach_nearest/models/json_api_news/NewData.dart';
import 'package:coach_nearest/netwrork/remote/api_manager.dart';
import 'package:coach_nearest/screens/new_card.dart';
import 'package:coach_nearest/screens/settings_screen.dart';
import 'package:coach_nearest/screens/tab_item.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import '../models/json_api_sources/sources_api.dart';
import '../shared/translate_assets/language.dart';

class tab_controller extends StatefulWidget {

  List<Sources> sources;

  tab_controller(this.sources,);

  @override
  State<tab_controller> createState() => _tab_controllerState();
}

class _tab_controllerState extends State<tab_controller> {

  int selectedIndex = 0;
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {

   //  String lang = "";
   //
   // String? langCode (Language? language) {
   //    if(language != null){
   //      MyApp.setLocale(context, Locale(language.languageCode,""));
   //      lang = language.languageCode;
   //      return lang;
   //    }
   //  };
    Language? language;
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child:
          TabBar(
            indicatorColor: Color(0xff3a4c40),
            onTap: (index){
              selectedIndex = index;
             setState(() {

             });
            },

            isScrollable: true,
            indicatorWeight: 0.01 ,// or 0.1
            tabs: widget.sources.map((source) =>
            Tab(child:
            Tab_Item(source,widget.sources.indexOf(source)==selectedIndex)
            )
            ).toList(),
          ),
        ),
        FutureBuilder<NewData>(
        future: api_manager.getNewsData(widget.sources[selectedIndex].id??"",settings_screen.lang),
            builder: ( context, snapshot) {

          var news = snapshot.data?.articles?? [];
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      itemCount:     news.length , // Or   snapshot.data?.articles?.length,
                      itemBuilder: (context,index){
                     return new_card(news[index]);
                      }),
                );
              } else if (snapshot.hasError) {
                return Center(child: Lottie.asset(Assets.jsonLottieError));
              } else {
                return Center(child: CircularProgressIndicator(color: Colors.green,));
              }
            })
      ],
    );
  }
}
