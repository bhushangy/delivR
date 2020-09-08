import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivr/constants/constants.dart';
import 'package:delivr/provider/provide_area.dart';
import 'package:delivr/screens/stores/widgets/sliver_tab_bar.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final _firestore = Firestore.instance;

class StoreList extends StatefulWidget {
  String label, name;

  StoreList({this.label, this.name});
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> streamPath = _firestore
        .collection('Areas/' +
            Provider.of<ProvideArea>(context, listen: false).area +
            '/' +
            widget.label)
        .snapshots();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThemeColor,
        elevation: 7,
        title: Text(
          widget.name,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: SizeConfig.safeBlockHorizontal * 4.5),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch(streamPath));
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.safeBlockVertical * 1,
            ),
            StoreStream(
              label: widget.label,
            )
          ],
        ),
      ),
    );
  }
}

class StoreStream extends StatelessWidget {
  String label;
  List<StoreTiles> storeTiles = [];
  StoreStream({this.label});

  void _showDialog(
    String a,
    String b,
    BuildContext context,
  ) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 6.2,
              SizeConfig.safeBlockHorizontal * 2,
              SizeConfig.safeBlockHorizontal * 4,
              SizeConfig.safeBlockHorizontal * 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: new Text(
            a,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal * 5),
          ),
          content: new Text(
            b,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.normal,
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                " OK",
                style:
                    TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3.5),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ignore: missing_return
  Future<bool> getConnectivityStatus(BuildContext context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
    } on SocketException catch (_) {
      _showDialog(
          "No Internet!", "Please check your internet connection.", context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('Areas/' +
                Provider.of<ProvideArea>(context, listen: false).area +
                '/' +
                label)
            .snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          // snapshot is a list of documents present in the collection
          // ignore: unrelated_type_equality_checks
          if (snapshot.connectionState == ConnectionState.waiting ||
              // ignore: unrelated_type_equality_checks
              getConnectivityStatus(context) == false) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            _showDialog("No internet!",
                "Please check your internet connectivity.", context);
          }
          final stores = snapshot.data.documents;
          if (stores.length == 0) {
            return Container(
              alignment: Alignment.center,
              child: Text('No ' + label + ' stores in your area'),
            );
          } else {
            for (var store in stores) {
              final storeTile = StoreTiles(
                store: store,
              );
              storeTiles.add(storeTile);
//            storeTiles.add(storeTile);
//            storeTiles.add(storeTile);
//            storeTiles.add(storeTile);
            }
            return ListView(
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: storeTiles,
            );
          }
        },
      ),
    );
  }
}

class StoreTiles extends StatelessWidget {
  DocumentSnapshot store;
  StoreTiles({this.store});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.local_grocery_store),
      title: Text(
        store.data["name"],
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            color: kTextColor,
            fontSize: SizeConfig.safeBlockHorizontal * 3),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      subtitle: Text(
        store.data["address"],
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.normal,
            color: kTextColor,
            fontSize: SizeConfig.safeBlockHorizontal * 2.5),
      ),
      isThreeLine: true,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SliverTabBar(
            store: store,
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final Stream<QuerySnapshot> streamPath;
  DataSearch(this.streamPath);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Oh Snap!!Something went wrong :( '),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamPath,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('No data'),
          );
        }

        final results = snapshot.data.documents.where((store) => store
            .data['name']
            .toString()
            .toLowerCase()
            .startsWith(query.toLowerCase()));

        return ListView(
            children: results
                .map<Widget>(
                  //thank god to have found stu macdonald @ stackoverflow :)
                  (store) => ListTile(
                    leading: Icon(Icons.local_grocery_store),
                    title: Text(
                      store.data["name"],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                          fontSize: SizeConfig.safeBlockHorizontal * 3),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    subtitle: Text(
                      store.data["address"],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          color: kTextColor,
                          fontSize: SizeConfig.safeBlockHorizontal * 2.5),
                    ),
                    isThreeLine: true,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SliverTabBar(store: store),
                      ),
                    ),
                  ),
                )
                .toList());
      },
    );
  }
}
