import 'package:flutter/material.dart';
import 'LoginandSignup/LoginPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        textSelectionHandleColor: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
    );
  }
}
