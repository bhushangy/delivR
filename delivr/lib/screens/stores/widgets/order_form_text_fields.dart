import 'package:delivr/constants/constants.dart';
import 'package:delivr/provider/provide_items.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderFormTextFields extends StatelessWidget {
  int count;
  TextEditingController control;
  OrderFormTextFields({this.count,this.control});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProvideItems>(
      builder: (BuildContext context, ProvideItems provideItemsObject, Widget child) {
        return Container(
          margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 6,
              right: SizeConfig.blockSizeHorizontal * 6,
              top: SizeConfig.safeBlockVertical * 2,
              bottom:SizeConfig.safeBlockVertical * 4,),
          child: TextField(
            controller: control,
            maxLines: null,
            keyboardType: TextInputType.text,
            cursorColor: kThemeColor,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kThemeColor),
              ),
              labelText: 'Item '+count.toString(),
              labelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.safeBlockHorizontal * 4,
                color: Colors.grey,
              ),
            ),
          textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}
