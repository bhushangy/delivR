import 'package:delivr/constants/constants.dart';
import 'package:delivr/provider/provide_items.dart';
import 'package:delivr/screens/stores/widgets/order_form_text_fields.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProvideItems>(
      builder: (BuildContext context, ProvideItems value, Widget child) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.safeBlockVertical * 4,
                    left: SizeConfig.blockSizeHorizontal * 6),
                child: Text(
                  '🛒 Add items to list ...',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    color: kTextColor,
                    fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    OrderFormTextFields widget = value.items.elementAt(index);
                    return widget;
                  },
                  itemCount: value.itemCount,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
