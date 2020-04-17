import 'package:delivr/ItemCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';

import 'BottomSheetContent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  void signOutGoogle() async {
    await googleSignIn.signOut();
    Navigator.pop(context);
    print("User Sign Out");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 0.33 * MediaQuery.of(context).size.height,
                    width: double.infinity,
                    color: Colors.indigo,
                  ),
//                  Positioned(
//                    bottom: 50.0,
//                    right: 100.0,
//                    child: Container(
//                      height: 400.0,
//                      width: 400.0,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(200.0),
//                          color: Color(0xFF3830B5)
//                              .withOpacity(0.4)),
//                    ),
//                  ),
//                  Positioned(
//                    bottom: 100.0,
//                    left: 150.0,
//                    child: Container(
//                        height: 300.0,
//                        width: 300.0,
//                        decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(150.0),
//                            color: Color(0xFF3830B5)
//                                .withOpacity(0.5))),
//                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 0.05 * MediaQuery.of(context).size.width,
                            ),
                            GestureDetector(
                              child: Container( 
                                alignment: Alignment.topLeft,
                                height: 50.0,
                                width: 50.0, child:Icon(Icons.arrow_back,color: Colors.white,size: 30,)
                                ),
                            ),
                            SizedBox(
                              width: 0.54 * MediaQuery.of(context).size.width,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet<dynamic>(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0xFF757575),
                                    context: context,
                                    builder: (context) => BottomSheetContent());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF5C6BC0).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(
                                      width: 0.5, color: Colors.white),
                                ),
                                child: Center(
                                  child: Text('How it works?',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.normal),
                                        fontSize: 12,
                                      )),
                                ),
                                width: MediaQuery.of(context).size.width -
                                    0.755 * (MediaQuery.of(context).size.width),
                                height: 25,
//                              child: IconButton(
//                                  icon: Icon(
//                                    Icons.menu,
//                                    color: Colors.white,
//                                    size: 33.0,
//                                  ),
//                                  onPressed: () {}),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 2),
                        child: Text(
                          'Hello , Bhushan...',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            textStyle: TextStyle(
                                fontSize: 33.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0, top: 2),
                        child: Text(
                          'What do you want to buy ?',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            textStyle: TextStyle(
                                fontSize: 23.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 170,
                child: ListView(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Itemcard(
                        title: 'Fruits and Vegetables',
                        img: 'assets/images/food.png',
                        descrip: 'cdscdcdsc'),

                    Itemcard(
                        title: 'Grocery Items',
                        img: 'assets/images/market.png',
                        descrip: 'cdscdcdsc'),

                    Itemcard(
                        title: 'Medicinal Supplies',
                        img: 'assets/images/pharmacy.png',
                        descrip: 'cdscdcdsc'),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
