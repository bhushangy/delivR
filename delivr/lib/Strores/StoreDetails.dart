import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/ScaleConfig/ScaleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreDetails extends StatelessWidget {
  DocumentSnapshot store;
  StoreDetails({this.store});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColor,
        elevation: 7,
        title: Text(
          store.data["name"],
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 4.5),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Text(store.data["ownner"]),
        ),
      ),
    );
  }
}
