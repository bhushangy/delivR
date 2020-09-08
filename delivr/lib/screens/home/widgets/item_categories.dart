import 'package:delivr/screens/stores/store_list_page.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCategory extends StatefulWidget {
  String imgPath, label,name;
  Color col;
  ItemCategory({this.imgPath, this.col, this.label,this.name});
  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => StoreList(label:widget.label,name:widget.name)));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: widget.col),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
              offset: Offset(
                5.0, // Move to right 10  horizontally
                10.0, // Move to bottom 10 Vertically
              ),
            )
          ],
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFF9F9F9),
        ),
        height: SizeConfig.safeBlockVertical * 15,
        width: SizeConfig.safeBlockHorizontal * 45,
        child: SvgPicture.asset(
          widget.imgPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}