import 'package:delivr/constants/constants.dart';
import 'package:delivr/provider/provide_area.dart';
import 'package:delivr/screens/home/widgets/item_categories.dart';
import 'package:delivr/screens/home/widgets/rules_containers.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



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
                                      SizeConfig.safeBlockHorizontal * 3.8,),
                            ),
                            selected: value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                value = selected ? index : null;
                                Provider.of<ProvideArea>(context, listen: false)
                                    .updateArea(areas[index]);
                                print(Provider.of<ProvideArea>(context,
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
          ),
        ],
      ),
    );
  }
}
