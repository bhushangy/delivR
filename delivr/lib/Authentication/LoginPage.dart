import 'package:delivr/Authentication/OtpScreen.dart';
import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/ScaleConfig/ScaleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:SizeConfig.safeBlockHorizontal*5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 50,
                    width: SizeConfig.safeBlockHorizontal * 90,
                    child: SvgPicture.asset(
                      'assets/images/LoginPage/shop.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2,
                  ),
                  Padding(
                    padding:EdgeInsets.only(left:SizeConfig.safeBlockHorizontal*1.5),
                    child: Container(
                      child: Text(
                        'LogIn.',
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,color: kTextColor,fontSize: SizeConfig.safeBlockHorizontal*8),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 5,
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 9,
                    width: SizeConfig.safeBlockHorizontal * 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(0, 10)
                        ),
                      ],
                    ),
                    child: Center(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        cursorColor: kThemeColor,
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.phone,size: SizeConfig.safeBlockHorizontal*6,color: kThemeColor,),
                            border: InputBorder.none,
                            hintText: " Phone",
                            hintStyle: GoogleFonts.montserrat(color: Colors.grey,fontWeight: FontWeight.w700,
                              fontSize:SizeConfig.safeBlockHorizontal*4,)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 8.5,
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: SizeConfig.safeBlockHorizontal * 45,
                height: SizeConfig.safeBlockVertical * 7,
                child: InkWell(
                  child: Material(
                    color: kThemeColor,
                    elevation: 5,
                    borderRadius:  BorderRadius.circular(50),
                    child: Center(
                      child: FittedBox( // here box is the parent container
                          fit: BoxFit.contain,
                          child: Text("SEND OTP", style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.bold,fontSize:SizeConfig.safeBlockHorizontal*4,),)),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
