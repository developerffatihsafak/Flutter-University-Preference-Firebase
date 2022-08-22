import 'package:flutter/material.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/ekranlar/tema.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/sqlLite/veritabani.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/veritabanimodel/model.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/wid/wid.dart';

import 'package:sqflite/sqlite_api.dart';

class Favoriler extends StatefulWidget {
  @override
  _FavorilerState createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  List<TercihModel> tercihListesi;
  @override
  void initState() {
   
    super.initState();
    getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler"),
        actions: [ 
        
        ],
      ),
      body: Stack(
        children: [
          tercihListesi != null
              ? ListView.builder(
                  itemCount: tercihListesi.length,
                  itemBuilder: (context, index) {
                    return TercihCard(
                      wallpaperModel: tercihListesi[index],
                      calBack: getDataList,
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
                
    
        ],
      ),
    );
  }

  void getDataList() async {
    Database database = await AccessDatabase.accessDatabase.getDatabase;
    List<Map<String, dynamic>> result = await database.query('Tercihler', 
     where:"fav =1" );
    List<TercihModel> list = List.generate(
        result.length, (index) => TercihModel.fromJson(result[index]));

    setState(() {
      tercihListesi = list;
    });
  }
}