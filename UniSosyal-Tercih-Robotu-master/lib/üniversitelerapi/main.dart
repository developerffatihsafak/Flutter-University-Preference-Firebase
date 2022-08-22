
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/page/filter_local_list_page.dart';
import 'package:flutter_application_1/%C3%BCniversitelerapi/page/filter_network_list_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

 
}

class Uniler extends StatelessWidget {
  static final String title = 'Tüm Üniversiteler';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}



class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('UniSosyal', style: style),
          title: Text('En İyi Üniversiteler'),
         
          
        ),
        BottomNavigationBarItem(
          icon: Text('UniSosyal', style: style),
          title: Text('Tüm Üniversiteler'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return FilterLocalListPage();
        
      case 1:
        return FilterNetworkListPage();
      default:
        return Container();
    }
  }
}
