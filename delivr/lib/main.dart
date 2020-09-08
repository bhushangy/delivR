import 'package:delivr/provider/provide_area.dart';
import 'package:delivr/provider/provide_items.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:delivr/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProvideArea()),
          ChangeNotifierProvider(create: (_) => ProvideItems()),
        ],
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
