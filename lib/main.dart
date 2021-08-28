import 'package:flutter/material.dart';
import 'package:myapp/views/DataPage.dart';
import 'package:myapp/views/HomePage.dart';
import 'package:myapp/views/supportPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/users': (context) => DataPage(),
        '/support': (context) => SupportPage(),
      },
    );
  }
}
