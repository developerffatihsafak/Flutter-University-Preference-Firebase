
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase/pstServices.dart';
import 'package:flutter_application_1/modeller/post.dart';

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  Post post = Post(0, " ", " "," "," ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ÜniSosyal Yorum Ekle"),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
      ),
      body: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  maxLength: 16,
                  decoration: InputDecoration(
                            suffixIcon: Icon(
                                        Icons.school,
                                        color: Colors.black45,
                                      ),
                                      
                      labelText: "Üniversite Adı(zorunlu alan)",
                      
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.title = val,
                  validator: (val){
                    if(val.isEmpty ){
                            ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Üniversite Adı Alanı Boş Geçildi ! '),
          ),
        );
                    }else if(val.length > 16){
                             ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Üniversite Adı 16 Karakterden Fazla olamaz ! Kayıt Başarısız. '),
          ),
        );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                            suffixIcon: Icon(
                                        Icons.subtitles_sharp,
                                        color: Colors.black45,
                                      ),
                      labelText: "Bölüm (zorunlu alan)",
                      
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.body = val,
                  validator: (val){
                    if(val.isEmpty){
                      
                      
                       ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bölüm Alanı Boş Geçildi ! '),
          ),
        );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: 100,
                  decoration: InputDecoration(
                            suffixIcon: Icon(
                                        Icons.comment_bank_outlined,
                                        color: Colors.black45,
                                      ),
                      labelText: "Ne Düşünüyorsun ?",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.tarih = val,
                 
                ),
              ),
              Padding(
                
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                 maxLength: 1,
                  decoration: InputDecoration(
                            suffixIcon: Icon(
                                        Icons.star,
                                        color: Colors.black45,
                                      ),
                      labelText: "Puan Ver (0-9)",
                      border: OutlineInputBorder()
                  ),
                  onSaved: (val) => post.trh = val,
                  validator: (val){
                    if(val.isEmpty){
                             ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Puan Ver Alanı Boş Geçildi ! '),
          ),
        );
                    }
                  },
                ),
              ),
                   
      
            ],
          )),
          
          
      floatingActionButton: FloatingActionButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Üniversite Verisi Ekleniyor...'),
          ),
        );
        insertPost();
        
        Navigator.pop(context);

      },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.green,
        tooltip: "Veri Ekle",),
    );
  }

  void insertPost() {
    final FormState form = formkey.currentState;
    if(form.validate()){
      form.save();
      form.reset();
      post.date = DateTime.now().millisecondsSinceEpoch;
      PostService postService = PostService(post.toMap());
      postService.addPost();
    }
  }



}