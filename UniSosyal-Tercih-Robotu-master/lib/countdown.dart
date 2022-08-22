import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

import 'ekranlar/AnaSayfa.dart';



class NeKadarKaldi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    DateTime.parse("2021-06-26 09:00");
 final birthday = DateTime(2021, 06, 26,9,0,0);
 final date2 = DateTime.now();
 final difference = birthday.difference(date2);
 final saat=difference.inHours;
 final gun=difference.inDays;
    
    
    
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('YKS NE KADAR KALDI'),
        centerTitle: true,
          actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.home_filled,
        color: Colors.white,
      ),
      onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnaSayfa()),
                );
      },
    )
  ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
             const Image(
  image: NetworkImage('https://www.jing.fm/clipimg/full/113-1139670_manage-time-png-time-management-black-and-white.png'),
),
            Text('YKS Sınavına Kalan Süre  ',style: TextStyle(fontSize: 20),),
            SlideCountdownClock(
                duration: Duration( hours: saat ),
              shouldShowDays: true,
              slideDirection: SlideDirection.Up,
              separator: ':',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                separatorTextStyle: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                ),
              padding: EdgeInsets.all(10),
              onDone: (){
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('YKS SINAVINDA BAŞARILAR...')));
              },
            ),
            Divider(color: Colors.white,thickness: 1.0,),
            SizedBox(height: 0,),
           
 
          ],
        ),
      ),
    );
  }
}
