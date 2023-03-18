

import 'package:flutter/material.dart';
import 'package:notlar/gorevParts/itemDataBase.dart';
import 'package:provider/provider.dart';

class GorevEkleyici extends StatelessWidget {

  final textController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.60 ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          children: [
            TextField(
             maxLines: 3,
             minLines: 1,
             controller: textController,
              decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Not',hintText: '...'),
              style: Theme.of(context).textTheme.subtitle2,
              autofocus: true,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Provider.of<GorevDataBase>(context,listen: false).addGorev(textController.text) ;
              Navigator.pop(context) ;
            }, child: Text('Not ekle')),

          ],
        ),
      ),
    );
  }
}
