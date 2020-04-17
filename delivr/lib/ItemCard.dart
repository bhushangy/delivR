import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Itemcard extends StatelessWidget {
  String title, img, descrip;
  bool select = false;
  Itemcard({this.title, this.img, this.descrip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          height:150,
          width: 0.8* MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            //border: Border.all(width: 0.5, color: Colors.indigo),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.scaleDown)),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '$title',
                    style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: 175.0,
                    child: Text(
                      'Scancjbsdcbdskbcdbcjkbsdkjbdscbdscbcjkbdjkcbdskjbckjsbckjbckjsdbckjdbsckjbsbcjkbdkjc',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
