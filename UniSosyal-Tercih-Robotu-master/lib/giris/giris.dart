
import 'package:flutter/material.dart';
import 'package:flutter_application_1/giris/ss.dart';




class GirisEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animasyon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SsGiris(),
    );
  }
}