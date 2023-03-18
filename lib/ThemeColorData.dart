


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeColorData with ChangeNotifier {




  final ThemeData greenTheme = ThemeData(
      scaffoldBackgroundColor: Colors.green,
      // appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,

      ),
      textTheme:
      const TextTheme(
          subtitle1: TextStyle(fontFamily: 'Spartan MB',color:Colors.white,fontSize: 30 ),
          subtitle2: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)
      )
  );

   final ThemeData redTheme = ThemeData(
      scaffoldBackgroundColor: Colors.red,
      // appBarTheme: AppBarTheme(backgroundColor: Colors.green),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,

      ),
      textTheme:
      const TextTheme(
          subtitle1: TextStyle(fontFamily: 'Spartan MB',color:Colors.white,fontSize: 30 ),
          subtitle2: TextStyle(fontSize: 18,fontWeight: FontWeight.normal)
      )
  );





  late bool isGreen =true;
  static late SharedPreferences _sharedPreferences ;

  void selectTheme (bool arrivedData) {

     isGreen=  arrivedData;

    setPrefTheme(arrivedData) ;
    notifyListeners();
  }

   ThemeData get selectedTheme =>isGreen?greenTheme:redTheme;

  Future<void> createSharedPrefTheme() async{
    _sharedPreferences =await SharedPreferences.getInstance();
  }
  void setPrefTheme (bool value) {
    _sharedPreferences.setBool('themeData', value) ;
  }

  void getPrefTheme () {

    if (_sharedPreferences.getBool('themeData')==null) {
      isGreen = true ;
    } else {
      isGreen= _sharedPreferences.getBool('themeData')! ;
    }
  }

}