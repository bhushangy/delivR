import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/Provider/ManageState.dart';
import 'package:delivr/ScaleConfig/ScaleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final databaseReference = Firestore.instance;

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColor,
        elevation: 7,
        title: Text(
          'Orders',
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
