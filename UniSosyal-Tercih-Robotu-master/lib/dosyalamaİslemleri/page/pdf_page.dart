import 'package:flutter/material.dart';
import 'package:flutter_application_1/dosyalama%C4%B0slemleri/api/pdf_api.dart';
import 'package:flutter_application_1/dosyalama%C4%B0slemleri/main.dart';
import 'package:flutter_application_1/dosyalama%C4%B0slemleri/widget/button_widget.dart';


class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("En girişimci Üniversiteler"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Türkiye'nin en girişimci ve yenilikçi 50 üniversitesi açıklandı. Bilim, Sanayi ve Teknoloji Bakanı Nihat Ergün, bu sene 86 puanla Orta Doğu Teknik Üniversitesi'nin girişimcilik  ve yenilikçilik konusunda birinci olduğunu bildirdi." 
                ,style: TextStyle(fontSize: 20, color: Colors.black),),
                ButtonWidget(
                  text: 'En girişimci üniversiteler PDF ',
                  onClicked: () async {
                    final pdfFile = await PdfApi.generateTable();

                    PdfApi.openFile(pdfFile);
                  },
                ),
                const SizedBox(height: 24),
            
              ],
            ),
          ),
        ),
      );
}
