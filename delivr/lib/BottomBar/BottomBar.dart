import 'package:delivr/HomePage.dart';
import 'package:delivr/Screens/Complain.dart';
import 'package:delivr/Screens/Orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    HomePage(),
    Orders(),
    Complain(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        color: Color(0xFFFAFAFA),
        elevation: 10.0,
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        HomePage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      color: currentTab == 0 ? Colors.indigo : Colors.grey,
                      size: 25,
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.montserrat(
                        color: currentTab == 0 ? Colors.indigo : Colors.grey,
                        textStyle: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        Orders(); // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.menu,
                        color: currentTab == 1 ? Colors.indigo : Colors.grey,
                        size: 25),
                    Text(
                      'Orders',
                      style: GoogleFonts.montserrat(
                        color: currentTab == 1 ? Colors.indigo : Colors.grey,
                        textStyle: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        Complain(); // if user taps on this dashboard tab will be active
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: currentTab == 2 ? Colors.indigo : Colors.grey,
                      size: 25,
                    ),
                    Text(
                      'Complain',
                      style: GoogleFonts.montserrat(
                        color: currentTab == 2 ? Colors.indigo : Colors.grey,
                        textStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
