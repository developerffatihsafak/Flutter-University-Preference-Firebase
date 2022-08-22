import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/api/books_api.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/data/book_data.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/model/book.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/widget/search_widget.dart';
import 'package:flutter_application_1/ekranlar/AnaSayfa.dart';
import 'package:flutter_application_1/ekranlar/veriEkle.dart';
import 'package:flutter_application_1/en%C3%87okTercihLocal/sayfa.dart';
import 'package:flutter_application_1/grafik/grf.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/sql.dart';
import 'package:flutter_application_1/yaptiklarim/main.dart';

import '../../countdown.dart';
import '../../hakkimizde.dart';
import '../../karar.dart';
import '../main.dart';

class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<UniversiteApi> books = [
    ];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getBooks(query);
  setState(() {
    this.books=books;
  });

  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(Uniler.title),
          centerTitle: true,
        ),
          drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 100.0,
                    ),
                    Text(
                      "ÜniSosyal",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Anasayfa'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Karar()),
                );
              },
            ),
               ListTile(
                 leading: Icon(Icons.star_half_outlined),
              title: Text('En Çok Tercih Edilen Sehirler'),
                 trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartApp()),
                );
              },
            ),
              ListTile(
                  leading: Icon(Icons.timelapse),
                  title: Text('YKS ne kadar Kaldı'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //VideoDemo
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NeKadarKaldi()),
                );
                  },
                ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Bugun Ne Yaptım'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Yaptiklarim()),
                );
              },
            ),
            /*ExpansionTile(
              leading: Icon(Icons.graphic_eq_outlined),
              title: Text('Grafikler'),
              trailing: Icon(Icons.arrow_drop_down),
              children: <Widget>[
                   ListTile(
              title: Text('En Çok Tercih Edilen Üniversiteler'),
                  trailing: Icon(Icons.star_half_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChartApp()),
                );
              },
            ),
                ListTile(
                  title: Text('Üniversiteler Öğrenci Sayıları'),
                  trailing: Icon(Icons.pie_chart),
                  onTap: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UniOgrenciSayisi()),
                );
                  },
                ),
               
            
              ],
            ),*/
          ListTile(
              leading: Icon(Icons.favorite_rounded),
              title: Text('En Çok Tercih Edilen Meslekler'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnCokTercihEdilen()),
                );
              },
            ),
        
            ListTile(
              leading: Icon(Icons.assistant_photo),
              title: Text('Biz Kimiz'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aciklama()),
                );
              },
            ),
          ],
        ),
      ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  
                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Üniversite Ara',
        onChanged: searchBook,
      );
      

   void searchBook(String query) {
    final books = allBooks.where((uni) {
      final titleLower = uni.name.toLowerCase();
      final authorLower = uni.adress.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  Widget buildBook(UniversiteApi uni) => ListTile(
       
         title: Text(
            uni.name,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          ),
          subtitle: Text(
            "Mail Adresi: " + uni.email + "\n" + "Telefon:"+uni.phone+"\n"+ "Adres:"+uni.adress+"\n"+ "Rektör:"+uni.rector+"\n"+ "WebSite:"+uni.website,
            style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        
      );
}
