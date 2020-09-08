import 'package:delivr/constants/constants.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesContainer extends StatefulWidget {
  String imgPath, txt;
  RulesContainer({this.imgPath, this.txt});
  @override
  _RulesContainerState createState() => _RulesContainerState();
}

class _RulesContainerState extends State<RulesContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFF9F9F9),
      ),
      width: SizeConfig.safeBlockHorizontal * 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: SizeConfig.safeBlockHorizontal * 80 / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.contain)),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 3,
          ),
          Container(
            child: Flexible(
              child: Center(
                child: Text(
                  widget.txt,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      fontSize: SizeConfig.safeBlockHorizontal * 3.5),
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 3,
          ),
        ],
      ),
    );
  }
}
