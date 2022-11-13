import 'package:flutter/material.dart';

import '../shared_widget/AllWidget.dart';



const Color textOfFirstWordAppBar=Color(0xffFF87A2);
const Color textOfSecondWordAppBar=Color(0xff000000);
const Color borderOfCategorical=Color(0xff2CB9B0);
const Color borderOfSelectedCategorical=Color(0xffFF5E34);



class ImageAndNameOFCategoricalBar{
  //------------Path-------------------------------------------------
  static const String pathOfGeneralImage="assets/images/general.png";
  static const String pathOfEventImage="assets/images/Event .png";
  static const String pathOfTheatersImage="assets/images/Exhibition.png";
  static const String pathOfExhibitionImage="assets/images/Theaters.png";
  static const String pathOfPoliticalImage="assets/images/Political.jpg";
 //-------------Name-------------------------------------------------
  static const String nameOfGeneralImage="General";
  static const String nameOfEventImage="Event";
  static const String nameOfExhibitionImage="Exhibition";
  static const String nameOfTheatersImage="Theaters";
  static const String nameOfPoliticalImage="Political";
//-------------------------------------------------------------------
}
//---------------------------------------------------------------
List<CategoricalBar> nameAndImageOfCategoricalBar=[
  const CategoricalBar(nameOfCategorical: 'General' ,pathOfImage:"assets/images/general.png",),
  const CategoricalBar(nameOfCategorical: 'Event' ,pathOfImage:"assets/images/Event .png",),
  const CategoricalBar(nameOfCategorical: 'Exhibition',pathOfImage:"assets/images/Exhibition.png",),
  const CategoricalBar(nameOfCategorical: 'Theaters' ,pathOfImage:"assets/images/Theaters.png",),
  const CategoricalBar(nameOfCategorical: 'Political' ,pathOfImage:"assets/images/Political.jpg",),
];

List<String> images = [
  "assets/images/Political.jpg",
  "assets/images/Theaters.png",
  "assets/images/Exhibition.png",
  "assets/images/Event .png",
  "assets/images/general.png",

];

