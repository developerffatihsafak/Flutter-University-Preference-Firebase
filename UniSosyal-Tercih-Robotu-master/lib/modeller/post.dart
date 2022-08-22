 
 
 import 'package:firebase_database/firebase_database.dart';

class Post{

  static const KEY = "key";
  static const DATE = "date";
  static const TITLE = "title";
  static const BODY = "body";
  static const TARIH = "tarih";
  static const TRH = "trh";

   int date;
   String key;
   String title;
   String tarih;
   String body;
    String trh;

  Post(this.date, this.title, this.tarih,this.trh, this.body );

//  String get key  => _key;
//  String get date  => _date;
//  String get title  => _title;
//  String get body  => _body;


  Post.fromSnapshot(DataSnapshot snap):
        this.key = snap.key,
        this.body = snap.value[BODY],
        this.tarih = snap.value[TARIH],
        this.trh = snap.value[TRH],
        this.date = snap.value[DATE],
        this.title = snap.value[TITLE];

  Map toMap(){
    return {BODY: body, TITLE: title, TARIH : tarih, TRH:trh, DATE: date, KEY: key};
  }
}