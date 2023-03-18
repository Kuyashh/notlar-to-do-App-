

import 'package:flutter/material.dart';



class CardWidget extends StatelessWidget {

  String gorev=' ';
  bool isChecked = false ;
  Function(void) toggleStatus;
  Function(void) deleteItem;
  CardWidget({this.gorev='',this.isChecked=false,required this.toggleStatus,required this.deleteItem}) ;
  @override
  Widget build(BuildContext context) {


    return Dismissible(
      key: UniqueKey(),
      onDismissed: deleteItem,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: isChecked? 7:2,
        child: ListTile(
          leading: Text(gorev,style: TextStyle(fontSize: 16,decoration: isChecked?TextDecoration.lineThrough:null),),
          trailing: Checkbox(
            activeColor: Colors.green,
            onChanged: toggleStatus,
            value: isChecked,

          ),
        )
      ),
    );
  }
}
