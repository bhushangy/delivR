import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: 0.33 * MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Colors.indigo,
            ),
          ]),
        ],
      ),
    );
  }
}
