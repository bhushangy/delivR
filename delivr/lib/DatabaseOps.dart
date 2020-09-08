import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivr/provider/provide_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final databaseReference = Firestore.instance;

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  Future createRecord() async {
    try {
      await databaseReference
          .collection("Areas")
          .document(Provider.of<ProvideArea>(context,listen: false).area) //widget.category.toUpperCase()
          .collection("Medicine")
          .document(
          "MALMEDAPP1") // by default it goes to bbmp document...but this can be changed
          .setData({
        'address': 'xxx',
        'gst': 'asdfghj1234',
        'name': 'Appolo Pharmacy 1',
        'ownner': 'Mukesh',
        'phone1': 1111111111,
        'phone2': 2222222222,
        'phone3': 3333333333,
        'res_address': 'xxx',
        'username': 'unique_username',
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: ()  async {
              await createRecord();
            },
            child: Text('Add'),
            color: Colors.tealAccent,
          ),
        ),
      ),
    );
  }
}
