
import 'dart:convert';

import 'package:coach_nearest/models/json_api_news/NewData.dart';
import 'package:coach_nearest/models/json_api_sources/sources_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../shared/constants/api.dart';


class api_manager{

  static Future<SourcesApi> getDataFromAPI(String category) async{

    Uri URL = Uri.https(
        Base_URL,
        End_Point_Sources,
        {"apiKey":my_apiKey,"category":category}
    );

     Response sources = await http.get(URL);

    var json = jsonDecode(sources.body);

      SourcesApi sourcesApi =   SourcesApi.fromJson(json);

      return sourcesApi;
  }


  static Future<NewData> getNewsData(String sourceId) async{

    Uri URL = Uri.https(
        Base_URL,
        End_Point_Everything,
        {"apiKey":my_apiKey,
        "sources":sourceId // to get data by id from api
        }
    );

    Response sources = await http.get(URL);

    var json = jsonDecode(sources.body);

    NewData newData = NewData.fromJson(json);

    return newData;

  }


}