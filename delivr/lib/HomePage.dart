import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.indigo,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.indigo,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 125.0,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 33.0,
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Hello , Bhushan',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            textStyle: TextStyle(
                                fontSize: 23.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25.0,top: 17.0),
                        child: Text(
                          'Please read the guidlines to place your order',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            textStyle: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
