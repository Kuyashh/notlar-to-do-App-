

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notlar/ThemeColorData.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tema Ayarları'),),
      body: SwitchCardWidget(),
    );
  }
}



class SwitchCardWidget extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    bool _value = Provider.of<ThemeColorData>(context).isGreen;

    return Card(
      child: SwitchListTile( activeColor: Colors.green,
        inactiveThumbColor: Colors.red,
        subtitle: Text(_value?'Yeşil':'Kırmızı',style:

        _value?
        TextStyle( color: Colors.green)
        :TextStyle( color: Colors.red)

        ),
        value: _value,
        title: Text('Tema rengini değiştir',style: Theme.of(context).textTheme.subtitle2,),
        onChanged: (bool value){



        Provider.of<ThemeColorData>(context,listen: false).selectTheme(value) ;
        },
      ),
    );
  }
}
