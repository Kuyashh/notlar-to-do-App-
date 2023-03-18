
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notlar/gorevParts/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GorevDataBase with ChangeNotifier{

    List<Gorev>  _gorevler = [] ;

    String notlar = '' ;

    void toggleStatus (int index) {
      _gorevler[index].togglesStatus();
         setListsPref(_gorevler);
      notifyListeners();
    }

    void addGorev (String metin) {
      _gorevler.add(Gorev(not: metin)) ;
      setListsPref(_gorevler);
      notifyListeners();
    }

    void deleteGorev (int index) {
      _gorevler.removeAt(index) ;
      setListsPref(_gorevler);
      notifyListeners() ;
    }

    static late SharedPreferences _sharedPreferences ;
    List<String> _gorevlerAsString = [] ;

    Future<void> createInstPref () async{
      _sharedPreferences = await SharedPreferences.getInstance();
    }

    // void setListsPref (List<Gorev> gorevs) {
    //   _gorevlerAsString.clear();
    //   for (var gorev in gorevs) {
    //     _gorevlerAsString.add(jsonEncode(gorev.toMap()));
    //   }
    //   _sharedPreferences.setStringList('toSetValue', _gorevlerAsString) ;
    // }

    void setListsPref(List<Gorev> gorevler) {
      _gorevlerAsString.clear();
      for(var gorev in gorevler) {
        _gorevlerAsString.add(jsonEncode(gorev.toMap()));
      }
      _sharedPreferences.setStringList('toSetValue', _gorevlerAsString) ;
    }



    void getListsPref ()   {
      _gorevler.clear();
          List<String> getTempList =  _sharedPreferences.getStringList('toSetValue')??[];
      for(var item in getTempList) {
        _gorevler.add(Gorev.fromMap(jsonDecode(item) )) ;
      }
    }

    // List<Gorev> get gorevler => _gorevler ;

    UnmodifiableListView<Gorev> get gorevler => UnmodifiableListView(_gorevler) ;


}



