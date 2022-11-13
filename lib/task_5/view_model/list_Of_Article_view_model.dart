import 'package:flutter/material.dart';
import '../FetchApi/DataCardFromApi.dart';
import '../FetchApi/FetchApi.dart';



class ArticlesListViewModel extends ChangeNotifier{

  List<Articles> _articlesList=[];

       fetchArticles() async{

     _articlesList = (await FetchApi.fetchStory())!;


   notifyListeners();
   }



  List<Articles> get articlesList => _articlesList;


}