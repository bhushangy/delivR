import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/HomePage/BottomNavBar.dart';
import 'package:delivr/Provider/ManageState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => ManageArea(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return new MaterialApp(
      theme: ThemeData(
        textSelectionHandleColor: kThemeColor,
        primaryColor: kThemeColor,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
