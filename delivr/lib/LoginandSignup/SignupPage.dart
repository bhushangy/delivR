import 'package:delivr/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool showPassword = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 40.0, 0, 0),
                      child: Text(
                        'Sign',
                        style: GoogleFonts.montserrat(
                            fontSize: 80.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.5, 0.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0.0, 120.0, 0, 0),
                        child: Text(
                          'Up',
                          style: GoogleFonts.montserrat(
                              fontSize: 80.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.22, 0.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30.0, 139.0, 0, 0),
                        child: Text(
                          '.',
                          style: GoogleFonts.montserrat(
                            fontSize: 80.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      cursorColor: Colors.indigo,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        labelText: 'EMAIL',
                        labelStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 33.0,
                    ),
                    TextField(
                      obscureText: showPassword,
                      cursorColor: Colors.indigo,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            setState(() {
                              showPassword == false
                                  ? showPassword = true
                                  : showPassword = false;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        labelText: 'PASSWORD',
                        labelStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),
                    Container(
                      height: 50.0,
                      child: Material(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: Colors.indigo,
                        elevation: 5.0,
                        child: GestureDetector(
                          onTap: () async {
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
              SizedBox(
                //this box comes into effect only when the keyboard is up and when keyboard closes it will disappear
                height: 20.0,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
