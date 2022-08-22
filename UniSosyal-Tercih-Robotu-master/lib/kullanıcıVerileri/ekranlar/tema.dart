import 'package:flutter/material.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/sqlLite/veritabani.dart';

import 'package:sqflite/sqlite_api.dart';

class AddWallpaperPage extends StatefulWidget {
  final Function callBack;

  const AddWallpaperPage({Key key, this.callBack}) : super(key: key);
  @override
  _AddWallpaperPageState createState() => _AddWallpaperPageState();
}

class _AddWallpaperPageState extends State<AddWallpaperPage> {
  Size _size;
  TextEditingController _url;
  TextEditingController _title;
  TextEditingController _category;
  TextEditingController _desc;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _url = TextEditingController();
    _title = TextEditingController();
    _category = TextEditingController();
    _desc = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Tercih Ekle"),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      height: _size.height * .6,
                      width: _size.width,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextFormField(
                                  controller: _url,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.indigo)),
                                      suffixIcon: Icon(
                                        Icons.photo,
                                        color: Colors.black45,
                                      ),
                                      hintText: "Resim Ekle(zorunlu değil)"),
                                ),
                              ),
                              TextFormField(
                                controller: _title,
                                maxLength: 40,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.indigo)),
                                              suffixIcon: Icon(
                                        Icons.school,
                                        color: Colors.black45,
                                      ),
                                    hintText: "Üniversite Adı"),
                              ),
                              TextFormField(
                                controller: _category,
                                
                                maxLength: 30,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.indigo)),
                                              suffixIcon: Icon(
                                        Icons.location_city,
                                        color: Colors.black45,
                                      ),
                                    hintText: "Şehir"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: TextFormField(
                                  controller: _desc,
                                  maxLength: 1000,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.indigo)),
                                                suffixIcon: Icon(
                                        Icons.comment_outlined,
                                        color: Colors.black45,
                                      ),
                                      hintText: "Ne düşünüyorsun?"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                )),
                SizedBox(
                  height: 60,
                ),
                RaisedButton(
                    color: Colors.blue,
                    child: !isLoading
                        ? Text(
                            "Tercihi Ekle +",
                            style: TextStyle(color: Colors.white),
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                    onPressed: !isLoading
                        ? () async {
                            setState(() {
                              isLoading = true;
                            });
                            AccessDatabase accessDatabase =
                                AccessDatabase.accessDatabase;
                            Database database =
                                await accessDatabase.getDatabase;
                            await database.insert('Tercihler', {
                              "url": _url.text,
                              "title": _title.text,
                              "category": _category.text,
                              "desc": _desc.text,
                              "fav": 0
                            });
                            
                            setState(() {
                              isLoading = false;
                            });
                            widget.callBack();
                            Navigator.pop(context);
                          }
                        : () {}),
                SizedBox(
                  height: 10,
                ),
              ]),
        ));
  }
}
