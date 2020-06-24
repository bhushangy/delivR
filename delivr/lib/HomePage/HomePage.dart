import 'package:delivr/Constants/Constants.dart';
import 'package:delivr/Orders/Orders.dart';
import 'package:delivr/ScaleConfig/ScaleConfig.dart';
import 'package:delivr/Strores/StoreList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:delivr/Provider/ManageState.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> AreaChips = [];
  List<String> areas = [
    'Yalahanka',
    'Malleshwaram',
    'Yashvanthapura',
    'Mahadevpura',
    'R R Nagara'
  ];
  int value = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kThemeColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kThemeColor,
        elevation: 7,
        leading: IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        title: Text(
          'delivR.',
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 4.5),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: SizeConfig.safeBlockHorizontal * 9,
                      left: SizeConfig.safeBlockHorizontal * 3),
                  child: Text(
                    'Select Location',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                        fontSize: SizeConfig.safeBlockHorizontal * 4.5),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              SingleChildScrollView(
                physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                primary: false,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 2.5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List<Widget>.generate(
                      areas.length,
                      (int index) {
                        return Container(
                          margin: EdgeInsets.only(
                              right: SizeConfig.safeBlockHorizontal * 2),
                          child: ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Color(0xFFF9F9F9),
                            label: Text(
                              areas[index],
                              style: GoogleFonts.montserrat(
                                  color: kTextColor,
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.8),
                            ),
                            selected: value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                value = selected ? index : null;
                                Provider.of<ManageArea>(context, listen: false)
                                    .changeArea(areas[index]);
                                print(Provider.of<ManageArea>(context,
                                        listen: false)
                                    .area);
                              });
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 80,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 3),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Instant delivery to your doorsteps',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 2.5,
                        right: SizeConfig.safeBlockHorizontal * 2.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ItemCategory(
                              imgPath: 'assets/images/HomePage/gro.svg',
                              col: Color(0xFFA5D6A7),
                              label: 'Grocery',
                              name:'Grocery & Essentials'
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 0.7,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 0.5),
                              child: Text(
                                'Grocery & Essentials',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 3.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ItemCategory(
                              imgPath: 'assets/images/HomePage/veg.svg',
                              col: Color(0xFF4A148C),
                              label: 'Vegetable',
                                name:'Vegetables',
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 0.7,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 0.5),
                              child: Text(
                                'Vegetables',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 3.5),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 2.5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 2.5,
                        right: SizeConfig.safeBlockHorizontal * 2.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ItemCategory(
                              imgPath: 'assets/images/HomePage/fruit.svg',
                              col: Color(0xFFFDD835),
                              label: 'Vegetable',
                                name:'Fruits',
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 0.7,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 0.5),
                              child: Text(
                                'Fruits',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 3.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ItemCategory(
                              imgPath: 'assets/images/HomePage/med.svg',
                              col: Color(0xFFEE3E54),
                              label: 'Medicine',
                                name:'Medicinal Supply',
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical * 0.7,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal * 0.5),
                              child: Text(
                                'Medicinal Supplies',
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: kTextColor,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 3.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              Container(
                //color: Colors.green,
                height: SizeConfig.safeBlockVertical * 23,
                width: double.infinity,
                child: ListView(
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal *
                          3.3, //See very important thing..do not give this padding for the parent container..
                      right: SizeConfig.safeBlockHorizontal * 3.3),
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    RulesContainer(
                        imgPath: 'assets/images/HomePage/location-pin.gif',
                        txt: 'Select your location from the above list...'),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    RulesContainer(
                        imgPath: 'assets/images/HomePage/shopping-cart.gif',
                        txt: 'Select the category of items you want to buy...'),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    RulesContainer(
                        imgPath: 'assets/images/HomePage/select-option.gif',
                        txt: 'Choose the store nearest to your location..'),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    RulesContainer(
                        imgPath: 'assets/images/HomePage/file-write.gif',
                        txt: 'List the items u want to buy and press order...'),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 4,
                    ),
                    RulesContainer(
                        imgPath: 'assets/images/HomePage/payment-success.gif',
                        txt:
                            'Pay after the items are delivered to your doorstep...')
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical*4,
              )
            ],
          )
        ],
      ),
    );
  }
}

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
