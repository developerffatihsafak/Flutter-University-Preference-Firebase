import 'package:flutter/material.dart';

import 'package:flutter_application_1/%C3%BCniversitelerapi/main.dart';

import 'package:flutter_application_1/ekranlar/AnaSayfa.dart';
import 'package:flutter_application_1/ekranlar/veriEkle.dart';
import 'package:flutter_application_1/en%C3%87okTercihLocal/api.dart';
import 'package:flutter_application_1/grafik/grf.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/sql.dart';

import '../hakkimizde.dart';
import 'local.dart';

class EnCokTercihEdilen extends StatefulWidget {
  @override
  EnCokTercihEdilenState createState() => EnCokTercihEdilenState();
}

class EnCokTercihEdilenState extends State<EnCokTercihEdilen> {
  List<OgrenciSayisi> ogrenciSayilari;
  String query = '';

  @override
  void initState() {
    super.initState();

    ogrenciSayilari = ogrSayisi;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("En Çok Tercih Edilen Meslekler"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: ogrenciSayilari.length,
                itemBuilder: (context, index) {
                  final book = ogrenciSayilari[index];

                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildBook(OgrenciSayisi uniOgrenciSayisi) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[ 
             
      
      new Card(
        child: new Column(
          children: <Widget>[
            
            new Padding(
                padding: new EdgeInsets.all(7.0),
                child: new Row(
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new Icon(Icons.compare_outlined),
                    ),
                    new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new Text('Meslek : '+ uniOgrenciSayisi.name,style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,
                color: Colors.blue),),
                    ),
                   
                    

                  ],
                
                ),
            ),
           
                      
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Text( uniOgrenciSayisi.aciklamasi,style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('Ortalama Maaş :  '+ uniOgrenciSayisi.ortalamaMaas,style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.red),),
             ),       
          ],
        ),
      )
                      

          ],
        ),
      );
}
