import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/HomePage/BottomNavBar.dart';
import 'package:delivr/ScaleConfig/ScaleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintsState createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kThemeColor,
          elevation: 7,
          title: Text(
            'Complaints',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 4.5),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
        child: Container(
    ),
    ),
    );
  }
}
