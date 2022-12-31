import 'dart:convert';
import 'package:coach_nearest/screens/category_screen.dart';
import 'package:coach_nearest/screens/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';
import '../generated/assets.dart';
import '../layout/home_screen.dart';
import '../models/json_api_sources/sources_api.dart';
import '../shared/constants/api.dart';
import 'home_screen.dart';


class SearchPage extends StatefulWidget {

  static const String routeName = "SearchPage";

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  String query = '';
  List<Article> news = [];


  Future<http.Response> searchNews(String query) async {

    Uri URL = Uri.https(
        Base_URL,
        End_Point_Everything,
        {"apiKey":my_apiKey,"q":query}
    );

    Response response = await http.get(URL);

    return response;
  }

  double index = 0.0;

  Widget appBarTitle = Text("");
  Icon actionIcon = Icon(Icons.search);
  String titleText = "Search";
 List<Sources> sources = [];

  @override
  Widget build(BuildContext context) {

    return  Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.imagesPattern2), fit: BoxFit.cover),),
      child: Scaffold(backgroundColor: Colors.transparent,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(index), child: this.appBarTitle,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
          actions:[
            IconButton(
                onPressed: (){
               setState(() {
                 if(this.actionIcon.icon == Icons.search){
                   this.actionIcon = Icon(Icons.close);
                   this.index = 50;
                   titleText =  AppLocalizations.of(context)!.empaty;
                   this.appBarTitle = SizedBox(
                     width: 250,
                     height: 80,
                     child: TextField(
                       onChanged: (value) {
                         setState(() {
                           query = value;
                         });
                       },
                       style: TextStyle(
                         color:  Colors.green
                       ),decoration:  InputDecoration(
                         filled: true,
                         hintText: AppLocalizations.of(context)!.search,
                         fillColor: Colors.white,
                         hintStyle: TextStyle(
                           color: Colors.green
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide:
                           BorderSide(width: 1, color: Colors.greenAccent),
                           borderRadius: BorderRadius.circular(50.0),
                         ),
                       border: OutlineInputBorder(
                         borderSide:
                         BorderSide(width: 1, color: Colors.greenAccent),
                         borderRadius: BorderRadius.circular(50.0),
                       ),
                       prefixIcon: IconButton(onPressed: () async {
                           final response = await searchNews(query);
                           final results = json.decode(response.body);
                           setState(() {
                             news = (results['articles'] as List)
                                 .map((article) => Article.fromJson(article))
                                 .toList();
                           });
                         },
                        icon: Icon(Icons.search_rounded,color: Colors.green,),
                       )
                     ),
                     ),
                   );
                 }else{
                   this.actionIcon = Icon(Icons.search);
                   this.appBarTitle = Text("");
                   this.index = 0;
                   titleText = AppLocalizations.of(context)!.searchtitle;
                 }
               });
            }, icon: actionIcon)
            ],
          backgroundColor: Color(0xff5f967c),
        title: Text(titleText,style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 3,
                          color: Colors.black54,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(5),right: Radius.circular(5)),
                              border: Border.all(
                                width: 5,
                                color: Colors.black12
                              ),
                            ),
                            child: Image.network(
                              news[index].imageUrl!,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                          ListTile(
                            title: Text(news[index].title!),
                            subtitle: Text(news[index].description!),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
      ),
    );
  }
}

class Article {
  final String? title;
  final String? description;
  final String? imageUrl;

  Article({this.title, this.description, this.imageUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      imageUrl: json['urlToImage'],
    );
  }
}





