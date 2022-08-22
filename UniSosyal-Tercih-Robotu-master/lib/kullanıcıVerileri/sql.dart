import 'package:flutter/material.dart';

import 'ekranlar/AnaSayfa.dart';




class UniSosyal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Üniversite Sosyal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KAnaSayfa(),
    );
  }
}