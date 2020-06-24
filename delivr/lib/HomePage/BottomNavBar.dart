import 'package:delivr/Complaints/Complaints.dart';
import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/Orders/Orders.dart';
import 'package:delivr/ScaleConfig/ScaleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomePage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> children = [
    HomePage(),
    Orders(),
    Complaints(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13,
        elevation: 5,
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: SizeConfig.safeBlockHorizontal * 5.1),
            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Home',
                style: GoogleFonts.montserrat(
                    fontSize: SizeConfig.safeBlockVertical * 1.6,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.error,
              size: SizeConfig.safeBlockHorizontal * 5.1,
            ),
            title: FittedBox(
              fit: BoxFit.contain,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Orders',
                  style: GoogleFonts.montserrat(
                      fontSize: SizeConfig.safeBlockVertical * 1.6,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart,
              size: SizeConfig.safeBlockHorizontal * 5.1,
            ),
            title: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Complaints',
                style: GoogleFonts.montserrat(
                    fontSize: SizeConfig.safeBlockVertical * 1.6,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
        selectedItemColor: kThemeColor,
      ),
    );
  }
}
