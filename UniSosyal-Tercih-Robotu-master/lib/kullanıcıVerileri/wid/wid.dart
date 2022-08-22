import 'package:flutter/material.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/ekranlar/page.dart';
import 'package:flutter_application_1/kullan%C4%B1c%C4%B1Verileri/veritabanimodel/model.dart';


class TercihCard extends StatefulWidget {
  final TercihModel wallpaperModel;
  final Function calBack;

  const TercihCard({Key key, this.wallpaperModel , this.calBack}) : super(key: key);
  @override
  _TercihCardState createState() => _TercihCardState();
}

class _TercihCardState extends State<TercihCard> {
  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: _size.width,
          height: _size.height * .5,
          child: InkWell(
            onTap: (){ 
              Navigator.push(context, MaterialPageRoute( 
                builder: (context)=>UniPage( 
                id: widget.wallpaperModel.id,
                clback: widget.calBack ,
              )));
            },
                      child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                    child: Image.network( widget.wallpaperModel.url ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.wallpaperModel.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Şehir: ${widget.wallpaperModel.category}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Detaylar için tıklayınız...",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}