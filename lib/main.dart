import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test3/PageScreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageScreen(),
    );
  }
}
