import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/pstServices.dart';
import 'package:flutter_application_1/ekranlar/edit.dart';
import 'package:flutter_application_1/ekranlar/veriEkle.dart';
import 'package:flutter_application_1/modeller/post.dart';

import 'package:timeago/timeago.dart' as timeago;

class PostView extends StatefulWidget {
  final Post post;

  PostView(this.post);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title + " Üniversitesi"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Yayınlanma Süresi:" +
                        timeago.format(DateTime.fromMillisecondsSinceEpoch(
                            widget.post.date)),
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                color: Colors.red,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Üniversite verisi Silindi  '),
                    ),
                  );
                  PostService postService = PostService(widget.post.toMap());
                  postService.deletePost();
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditPost(widget.post)));
                },
              ),
            ],
          ),
          Divider(),
          Card(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(
                    widget.post.title + " Üniversitesi",
                    style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  subtitle: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text(widget.post.body,
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('Puan : ${widget.post.trh}/10',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: new Text('Öğrenci Yorumu : ',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text('${widget.post.tarih}',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPost()));
                    },
                    icon: Icon(Icons.add, size: 18),
                    label: Text("Sen de Yorum Ekle"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
