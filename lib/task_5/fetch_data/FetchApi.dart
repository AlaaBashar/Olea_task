import 'dart:convert';
import 'package:http/http.dart' as http;
import 'DataCardFromApi.dart';

class FetchApi {

   static Future<List<Articles>?> fetchStory() async {
      var url = Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c5609b49c9274e89bacde5dcab5c52a2");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> resMap = jsonDecode(response.body);
      List listNews = resMap['articles'];
      return listNews.map((e) => Articles.fromJson(e)).toList();
    }
    return null;
  }
}