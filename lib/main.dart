import 'package:flutter/material.dart';
import 'package:myapp/views/DataPage.dart';
import 'package:myapp/views/HomePage.dart';
import 'package:myapp/views/supportPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String LOAD_DATA = 'profiles';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(LOAD_DATA);
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
