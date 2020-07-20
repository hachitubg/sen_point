import 'package:flutter/material.dart';
import 'package:sen_point/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sen point',
      home: Home(),
    );
  }
}
