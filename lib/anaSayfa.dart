import 'package:flutter/material.dart';
import 'package:notlar/Card.dart';
import 'package:notlar/gorevParts/GorevEkleyici.dart';
import 'package:notlar/gorevParts/itemDataBase.dart';
import 'package:notlar/settingsPage.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

late String gorev;

GorevDataBase gorevs = GorevDataBase();

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                context: context, builder: (context)=>GorevEkleyici()) ;
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage())) ;
            }, icon: Icon(Icons.settings))
          ],
          title: Text(
            'Notlar',
            style: TextStyle(fontFamily: 'Spartan Mb'),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: Center(
                    child: Text(
              '${Provider.of<GorevDataBase>(context).gorevler.length} Not Bulunuyor',
              style: Theme.of(context).textTheme.subtitle1,
            ))),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                  child: Consumer<GorevDataBase>(builder: (context,gorevDataBase,child){
                    return Align(alignment: Alignment.topCenter,
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount:
                        gorevDataBase.gorevler.length,
                        itemBuilder: (context, index) => CardWidget(

                          gorev: gorevDataBase.gorevler[index].not,
                          isChecked: gorevDataBase.gorevler[index].isDone,
                          toggleStatus: (_) {
                            gorevDataBase.toggleStatus(index) ;
                          },
                          deleteItem: (_){
                            gorevDataBase.deleteGorev(index) ;
                          },

                        ),
                      ),
                    );
                  },)
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

