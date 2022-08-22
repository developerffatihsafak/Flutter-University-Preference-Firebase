import 'package:flutter/material.dart';
import 'package:flutter_application_1/giris/giris.dart';



void main() {
  runApp(Uygulama());
}

class Uygulama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Üniversite App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GirisEkrani(),
    );
  }
}