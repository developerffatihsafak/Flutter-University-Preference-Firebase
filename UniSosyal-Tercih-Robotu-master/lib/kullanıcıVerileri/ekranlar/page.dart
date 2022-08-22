

import 'package:flutter/material.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/sqlLite/veritabani.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/veritabanimodel/model.dart';
import 'package:sqflite/sqlite_api.dart';

class UniPage extends StatefulWidget {
  
  final Function clback;
  final int id;
  const UniPage({Key key,  this.clback, this.id}) : super(key: key);
  @override
  _UniPageState createState() => _UniPageState();
}

class _UniPageState extends State<UniPage> {
  bool loading=false;
   TercihModel tercihModel;
   @override
  void initState() {
    
    super.initState();
    fav(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tercihModel !=null ? Text(tercihModel.title):Text(""),
        actions: [
          IconButton(
            
              icon: tercihModel !=null ? Icon(
                Icons.star,
                color: tercihModel.fav == 0 ? Colors.white:Colors.orange,
              ):Container(),
              onPressed: () { 
                  updatefav(tercihModel.id);

              }),
        ],
      ),
      body: tercihModel !=null ? SingleChildScrollView (
              child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(tercihModel.url)
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                    height: 20,
                  ),
                Text(
                      tercihModel.title,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Şehir: ${tercihModel.category}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   Text(
                    "Düşüncelerin : ",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.purple,
                    ),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                  Text(
                    tercihModel.desc,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height :60),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      RaisedButton( 
                      child: !loading? Text("Sil", 
                      style: TextStyle(color: Colors.white),
                      ):CircularProgressIndicator(),
                      color: Colors.red,
                      onPressed:  !loading? () async { 
                        setState(() {
                          loading = true;
                        });
                        await  deleteUni(tercihModel.id);
                        widget.clback();
                        Navigator.pop(context);
                        setState(() {
                          loading = false;
                        });
                    } :(){})
                     
                    ],
                  ),
                ],
              ),
            )
          ],
              ), 
      ):Center(child : CircularProgressIndicator()),
    );
  
  }
  Future<void> deleteUni(int id)async{ 
    Database database = await AccessDatabase.accessDatabase.getDatabase;
    database.delete('Tercihler',where: 'id=?',whereArgs: [id]);
  }
  Future<void> fav(int id)async{ 
    Database database = await AccessDatabase.accessDatabase.getDatabase;
    List<Map<String,dynamic>> result = await database.query('Tercihler',where: 'id=?',whereArgs: [id]);
    TercihModel localWallObj = TercihModel.fromJson(result[0]);
    setState(() {
      tercihModel =localWallObj;
    });
  }

   Future<void> updatefav(int id)async{ 
    Database database = await AccessDatabase.accessDatabase.getDatabase;
     await database.update('Tercihler', 
    { 
      "id":id,
      "url":tercihModel.url,
      "title" : tercihModel.title,
      "category":tercihModel.category,
      "desc" :tercihModel.desc,
      "fav" :tercihModel.fav ==0 ? 1:0,
    },
      where: "id=?",
     whereArgs: [id],);
     await fav(id);
  }

  
}
