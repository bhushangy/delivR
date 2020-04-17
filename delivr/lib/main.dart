import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginandSignup/LoginPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo,
      statusBarIconBrightness: Brightness.light,
    ));
    return new MaterialApp(
      theme: ThemeData(
        textSelectionHandleColor: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
    );
  }
}
