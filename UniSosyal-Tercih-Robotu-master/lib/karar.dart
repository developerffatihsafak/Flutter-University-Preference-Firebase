import 'package:flutter/material.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/main.dart';
import 'package:flutter_application_1/ekranlar/AnaSayfa.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/ekranlar/AnaSayfa.dart';
import 'package:flutter_application_1/yaptiklarim/main.dart';
import 'countdown.dart';
import 'enÇokTercihLocal/sayfa.dart';
import 'grafik/grf.dart';
import 'hakkimizde.dart';


class Karar extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}
 
class _SignupPageState extends State<Karar> {
   void uyari() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("En iyi Üniversiteler de , bu yıl üniversitelerin akademik performansını özetleyen URAP 2020-2021 Türkiye sıralamasında, Clarivate Analytics/InCites ile YÖK'ün yayımladığı veriler kullanıldı."),
          content: new Text("URAP 2020-2021 Türkiye sıralama tabloları"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("UniSosyal"),),
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 0.0),
              child: Text(
                'ÜniSosyal',
                style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(370.0, 0.0, 0.0, 0.0),
              child: Text(
                '.',
                style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            )
          ],
        ),
      ),
      Container(
          padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                " Tercih Robotu ve",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "  Universite Hazırlık Dostu",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.red,
                    color: Colors.red,
                    elevation: 10.0,
                    child: GestureDetector(
                      
                       onTapDown: (TapDownDetails details){ 
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tercih Listesi'),
                          ),
                        );
                    },
                        onTapCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Yönlendirme Başarısız '),
                          ),
                        );
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KAnaSayfa()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Tercih Listesi Oluştur',
                          
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                        
                      ),
                      
                    ),
                    
                  ), 
                  ),
                   SizedBox(height: 20.0),
                       Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                       onTapDown: (TapDownDetails details){ 
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(' YKS Ne Kadar Kaldı'),
                          ),
                        );
                    },
                        onTapCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Yönlendirme Başarısız '),
                          ),
                        );
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NeKadarKaldi()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'YKS Ne Kadar Kaldı',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 20.0),
              Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.blue,
                    color: Colors.blue,
                    elevation: 7.0,
                    child: GestureDetector(
                       onTapDown: (TapDownDetails details){ 
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Tüm Üniversiteler Hakkındaki bilgiler '),
                          ),
                        );
                    },
                      onTapCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Yönlendirme Başarısız '),
                          ),
                        );
                      },
                      onTap: () {
                       uyari();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Uniler()),
                        );
                      },
                      
                      child: Center(
                        child: Text(
                          'Tüm Üniversiteler',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 20.0),
                     Container(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.deepPurple,
                    color: Colors.deepPurple,
                    elevation: 7.0,
                    child: GestureDetector(
                       onTapDown: (TapDownDetails details){ 
                    ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('UniSosyal Akış '),
                          ),
                        );
                    },
                      onTapCancel: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Yönlendirme Başarısız '),
                          ),
                        );
                      },
                      onTap: () {
                       
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AnaSayfa()),
                        );
                      },
                      
                      child: Center(
                        child: Text(
                          'Akış',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
            ],
          )),
    ]));
  }
}
