import 'package:flutter/material.dart';

class Global
{
  static Color bg1Color = Colors.black;
  static Color bg2Color =  Colors.grey;
  static Color bg3Color =  Colors.blue;
  static Color bg4Color =  Colors.blueGrey;



  static String country = "In";
  static String title = "India";
  static String search = "Surat";
  static String gif = "assets/gif/Comp.gif";
  static Color color1 = Colors.white;

  static searchData(){
    if(country == "In")
    {
      search = "Surat";
      title = "India";
      gif = "assets/gif/Comp.gif";
      color1 = Colors.white;
    }
    else if(country == "UK")
    {
      search = "London";
      title = "United Kingdom";
      gif = "assets/gif/Newyork.gif";
      color1 = Colors.cyan;
    }
    else if(country == "ITU")
    {
      search = "verona";
      title = "Italy";
      gif = "assets/gif/Rome.gif";
      color1 = Colors.cyan;
    }
    else if(country == "RU")
    {
      search = "Moscow";
      title = "Russia";
      gif = "assets/gif/Comp.gif";
      color1 = Colors.cyan;
    }
    else
    {
      search = "nantes";
      title = "France";
      gif = "assets/gif/Rome.gif";
      color1 = Colors.cyan;
    }
  }

  static List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

}