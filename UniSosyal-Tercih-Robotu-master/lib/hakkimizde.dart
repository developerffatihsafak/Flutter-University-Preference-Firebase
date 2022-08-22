import 'package:flutter/material.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/main.dart';
import 'package:flutter_application_1/ekranlar/AnaSayfa.dart';

import 'ekranlar/veriEkle.dart';
import 'grafik/grf.dart';
import 'kullanıcıVerileri/sql.dart';


class Aciklama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MyTextPage());
  }
}

class MyTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkımızda"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              tooltip: 'Air it',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnaSayfa()),
                );
              }),
        ],
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
                  MaterialPageRoute(builder: (context) => AnaSayfa()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('Akışa Yorum Ekle'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPost()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.school_outlined),
              title: Text('Tüm Üniversiteler'),
              trailing: Icon(Icons.arrow_right),
              onTap: () { 
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Uniler()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Tercih Listesi Oluştur'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UniSosyal()),
                );
              },
            ),
            ExpansionTile(
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
                  title: Text('Genel'),
                  trailing: Icon(Icons.pie_chart),
                  onTap: () {
                   
                  },
                ),
                ListTile(
                  title: Text('Bilim'),
                  trailing: Icon(Icons.science),
                  onTap: () {
               
                  },
                ),
                ListTile(
                  title: Text('Tarih'),
                  trailing: Icon(Icons.history),
                  onTap: () {
                 
                  },
                ),
                ListTile(
                  title: Text('Spor'),
                  trailing: Icon(Icons.sports_football),
                  onTap: () {
                 
                    
                  },
                ),
                 ListTile(
                  title: Text('Kelime'),
                  trailing: Icon(Icons.wb_auto_rounded),
                  onTap: () {
                  
                    
                  },
                ),
              ],
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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: RichText(
            
            text: TextSpan(
              text:
                  'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3311456 kodlu  MOBİL PROGRAMLAMA dersi kapsamında 193311043 numaralı Furkan Fatih ŞAFAK tarafından 30 Nisan 2021 günü yapılmıştır.',
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nSELÇUK ÜNİVERSİTESİ',
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}