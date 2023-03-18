import 'package:flutter/material.dart';
import 'package:notlar/ThemeColorData.dart';
import 'package:notlar/gorevParts/itemDataBase.dart';
import 'package:provider/provider.dart';

import 'anaSayfa.dart';

 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
     await ThemeColorData().createSharedPrefTheme();
     await GorevDataBase().createInstPref();

  runApp(   MultiProvider(providers: [
  ChangeNotifierProvider<GorevDataBase>(create: (BuildContext context) =>GorevDataBase()),
    ChangeNotifierProvider<ThemeColorData>(create: (BuildContext context) =>ThemeColorData() )


  ],
  child: Main()));
}


class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<ThemeColorData>(context).getPrefTheme();
    // Provider.of<GorevDataBase>(context).getListsPref();
    ///bunlar yerine çoklu provider Çağırmada consumer uygulama optimizasyonunu artırır
    return Consumer2<ThemeColorData,GorevDataBase>(builder:
    (context,themeColorData,gorevDataBase,child){
      themeColorData.getPrefTheme();
      gorevDataBase.getListsPref();
      return MaterialApp(
        theme: Provider.of<ThemeColorData>(context).selectedTheme,
        home: const AnaSayfa(),
      ) ;
    }
    );
  }
}
