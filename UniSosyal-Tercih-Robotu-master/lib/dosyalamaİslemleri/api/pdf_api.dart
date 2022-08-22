import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class User {
  final String name;
  final int age;

  const User({ this.name,  this.age});
}

class PdfApi {
  static Future<File> generateTable() async {
    final pdf = Document();
  
    final headers = ['Sehir ', 'Ortalama Memnuniyeti'];

    final users = [
      User(name: 'Eskisehir', age: 90),
      User(name: 'Ankara', age: 89),
      User(name: 'Antalya', age: 88),
      User(name: 'Istanbul', age: 86),
      User(name: 'Edirne', age: 85),
      User(name: 'Aydin', age: 85),
      User(name: 'Mugla', age: 84),
      User(name: 'Trabzon', age: 84),
      User(name: 'Izmir', age: 82),
      User(name: 'Balikesir', age: 81),
      User(name: 'Hatay', age: 81),
      User(name: 'Ordu', age: 80),
      
      
    ];
    final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(Page(
      build: (context) => Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> generateImage() async {
    final pdf = Document();

    
    final imageJpg =
        (await rootBundle.load('assets/person.jpg')).buffer.asUint8List();

    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 1) {
          return FullPage(
            ignoreMargins: true,
            child: Image(MemoryImage(imageJpg), fit: BoxFit.cover),
          );
        } else {
          return Container();
        }
      },
    );

    pdf.addPage(
      MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          Container(
            height: pageTheme.pageFormat.availableHeight - 1,
            child: Center(
              child: Text(
                'Foreground Text',
                style: TextStyle(color: PdfColors.white, fontSize: 48),
              ),
            ),
          ),
          
         
          Center(
            child: ClipRRect(
              horizontalRadius: 32,
              verticalRadius: 32,
              child: Image(
                MemoryImage(imageJpg),
                width: pageTheme.pageFormat.availableWidth / 2,
              ),
            ),
          ),
          
        ],
      ),
    );

    return saveDocument(name: 'UniSosyal.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
     String name,
     Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
