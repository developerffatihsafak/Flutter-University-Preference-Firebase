import 'package:flutter/material.dart';

import 'package:flutter_application_1/ekranlar/veriEkle.dart';
import 'package:flutter_application_1/ekranlar/view.dart';
import 'package:flutter_application_1/en%C3%87okTercihLocal/sayfa.dart';
import 'package:flutter_application_1/grafik/grf.dart';
import 'package:flutter_application_1/modeller/post.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';


import 'package:flutter_application_1/yaptiklarim/main.dart';
import '../countdown.dart';
import '../hakkimizde.dart';
import '../karar.dart';



class AnaSayfa extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AnaSayfa> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String nodeName = "posts";
  List<Post> postsList = <Post>[];
   var items = List<Post>();

  @override
  void initState() {
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
  }
  void filterSearchResults(String query) {
   
    postsList.addAll(postsList);
    if(query.isNotEmpty) {
      
      postsList.forEach((item) {
        if(items.contains(query)) {
          postsList.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(postsList);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(postsList);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ÜniSosyal Yorumlar"),
        backgroundColor: Theme.of(context).accentColor,
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
      
      body: Container(
        
        color: Colors.white,
        child: Column(
          children: <Widget>[
        
        
        
            Visibility(
              visible: postsList.isEmpty,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Visibility(
              visible: postsList.isNotEmpty,
              child: Flexible(
                  child: FirebaseAnimatedList(
                      query: _database.reference().child('posts'),
                      itemBuilder: (_, DataSnapshot snap,
                          Animation<double> animation, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            child: ListTile(
                              title: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostView(postsList[index])));
                                },
                                title: Text(
                                  postsList[index].title + " Üniversitesi",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo),
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(bottom: 14.0),
                                child: Text(
                                  postsList[index].body +
                                      "\n\nPuan : " +
                                      postsList[index].trh +
                                      "/10\n\n"+"Detaylar için tıklayınız..." ,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPost()));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        tooltip: "Düzenle",
      ),
    );
  }


 
  _childAdded(Event event) {
    setState(() {
      postsList.add(Post.fromSnapshot(event.snapshot));
    });
  }

  void _childRemoves(Event event) {
    var deletedPost = postsList.singleWhere((post) {
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost = postsList.singleWhere((post) {
      return post.key == event.snapshot.key;
    });

    setState(() {
      postsList[postsList.indexOf(changedPost)] =
          Post.fromSnapshot(event.snapshot);
    });
  }
}
