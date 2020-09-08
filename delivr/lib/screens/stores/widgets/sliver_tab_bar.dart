import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivr/constants/constants.dart';
import 'package:delivr/provider/provide_items.dart';
import 'package:delivr/screens/stores/order_form_page.dart';
import 'package:delivr/screens/stores/store_info_page.dart';
import 'package:delivr/screens/stores/widgets/anchored_overlay.dart';
import 'package:delivr/screens/stores/widgets/fab_with_icons.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SliverTabBar extends StatefulWidget {
  DocumentSnapshot store;
  SliverTabBar({this.store});
  @override
  _SliverTabBarState createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                titleSpacing: 0.0,
                title: Text(
                  widget.store.data['name'],
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5),
                ),
                pinned: true,
                floating: true,
                forceElevated: false,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(
                      icon: Icon(Icons.format_list_bulleted),
                      text: 'Details',
                    ),
                    Tab(
                      icon: Icon(Icons.shopping_cart),
                      text: 'Order',
                    )
                  ],
                  controller: _tabController,
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              StoreInfo(store: widget.store),
              OrderForm(),
            ],
            controller: _tabController,
          ),
        ),
        floatingActionButton: _buildFab(context)
//         backgroundColor: kThemeColor,
//         child: Icon(Icons.add_shopping_cart),
        // onPressed: () {
        //   _tabController.animateTo(1,
        //       curve: Curves.linear, duration: Duration(milliseconds: 500));

        //   _scrollViewController.animateTo(
        //       _scrollViewController.position.minScrollExtent,
        //       duration: Duration(milliseconds: 1000),
        //       curve: Curves.decelerate);

        //  _scrollViewController
        //      .jumpTo(_scrollViewController.position.maxScrollExtent);
        // },
//       ),
        );
  }

  void _selectedFab(int index) {
    _tabController.animateTo(1,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.add, Icons.done];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        backgroundColor: kThemeColor,
        onPressed: () {},
        tooltip: 'Add Item or Order',
        child: Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
        elevation: 4.0,
      ),
    );
  }
}
