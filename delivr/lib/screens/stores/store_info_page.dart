import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivr/constants/constants.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  Widget build(BuildContext context) {
//    return Center(
//      child: Container(
//        child: Text(
//            'fsvfsvvsddcdshcjvdjhbcdvchsvcjhsvdj\ndvcjvcvcvsjvsjv\n\n\n\nbchsdvchdvvjsvshhv'),
//        See here if u do not give any height and width to the container, it is fluid and occupies howmuch ever space
//         its child needs...
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return InkWell(
//      child: Center(
//        child: FlatButton(onPressed: (){}, child: Text('CLick')),
//      ),
//    );
//  }
//the above will produce ripple effect only if the child is a widget with on tap property i.e usually buttons

class StoreInfo extends StatelessWidget {
  final DocumentSnapshot store;
  StoreInfo({this.store});

  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: <Widget>[
          InfoTiles(
            label: 'Store Name',
            name: store.data['name'],
            icon: Icon(Icons.store),
          ),
          InfoTiles(
            label: 'Store Address',
            name: store.data['address'],
            icon: Icon(Icons.location_on),
          ),
          InfoTiles(
            label: 'Store Owner',
            name: store.data['ownner'],
            icon: Icon(Icons.supervised_user_circle),
          ),
          InfoTiles(
            label: 'Contact Number 1',
            name: store.data['phone1'].toString(),
            icon: Icon(Icons.call),
          ),
          InfoTiles(
            label: 'Contact Number 2',
            name: store.data['phone2'].toString(),
            icon: Icon(Icons.call),
          ),
          InfoTiles(
            label: 'Contact Number 3',
            name: store.data['phone3'].toString(),
            icon: Icon(Icons.call),
          ),
          InfoTiles(
            label: 'Residence',
            name: store.data['res_address'],
            icon: Icon(Icons.home),
          ),
        ],
      );
    
  }
}

// ignore: must_be_immutable
class InfoTiles extends StatelessWidget {
  Icon icon;
  String name;
  String label;
  InfoTiles({this.label, this.icon, this.name});

  @override
  Widget build(BuildContext context) {
    return Material(
          child: ListTile(
        leading: icon,
        title: Text(
          label,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: kTextColor,
              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
        ),
        subtitle: Text(
          name,
          style: GoogleFonts.montserrat(
              color: kTextColor,
              fontSize: SizeConfig.safeBlockHorizontal * 3.5),
        ),
        isThreeLine: true,
      ),
    );
  }
}
