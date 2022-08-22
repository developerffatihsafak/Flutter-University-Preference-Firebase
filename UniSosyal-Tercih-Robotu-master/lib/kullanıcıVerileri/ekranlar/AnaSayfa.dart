import 'package:flutter/material.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/ekranlar/favoriler.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/ekranlar/tema.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/sqlLite/veritabani.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/veritabanimodel/model.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/wid/wid.dart';

import 'package:sqflite/sqlite_api.dart';

class KAnaSayfa extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<KAnaSayfa> {
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
        title: Text("Tercih Listesi Oluştur"),
        actions: [ 
          IconButton(icon: Icon(Icons.favorite_border_sharp), onPressed: (){ 
              Navigator.push(context, MaterialPageRoute(builder:(context) => Favoriler() ));
          }),
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
                
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.bottomRight,
   
                child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddWallpaperPage(
                                    callBack: getDataList,
                                  )));
                    })),
          )
        ],
      ),
    );
  }

  void getDataList() async {
    Database database = await AccessDatabase.accessDatabase.getDatabase;
    List<Map<String, dynamic>> result = await database.query('Tercihler');
    List<TercihModel> list = List.generate(
        result.length, (index) => TercihModel.fromJson(result[index]));

    setState(() {
      tercihListesi = list;
    });
  }
}