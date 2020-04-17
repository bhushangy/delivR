import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Complain extends StatefulWidget {
  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
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
