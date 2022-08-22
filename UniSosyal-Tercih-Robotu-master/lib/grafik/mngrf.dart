import 'package:flutter/material.dart';
import 'package:flutter_application_1/grafik/photo.dart';




class MnGrafik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Öğrenci Dostu uyg',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ZoomPage(),
    );
  }
}