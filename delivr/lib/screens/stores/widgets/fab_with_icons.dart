import 'package:delivr/constants/constants.dart';
import 'package:delivr/provider/provide_items.dart';
import 'package:delivr/screens/stores/widgets/order_form_text_fields.dart';
import 'package:delivr/util/scale_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FabWithIcons extends StatefulWidget {
  FabWithIcons({this.icons, this.onIconTapped});
  final List<IconData> icons;
  ValueChanged<int> onIconTapped;
  @override
  State createState() => FabWithIconsState();
}

class FabWithIconsState extends State<FabWithIcons>
    with TickerProviderStateMixin {
  AnimationController _controller;
  List<OrderFormTextFields> items = [];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.icons.length, (int index) {
        return _buildChild(index);
      }).toList()
        ..add(
          _buildFab(),
        ),
    );
  }

  Widget _buildChild(int index) {
    Color backgroundColor = kThemeColor;
    Color foregroundColor = Colors.white;
    return Container(
      height: SizeConfig.blockSizeVertical * 9.5,
      width: SizeConfig.safeBlockHorizontal * 14,
      // or height:70  width:56
      alignment: FractionalOffset.topCenter,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 1.0 - index / widget.icons.length / 2.0,
              curve: Curves.easeOut),
        ),
        child: FloatingActionButton(
          backgroundColor: backgroundColor,
          mini: true,
          child: Icon(widget.icons[index], color: foregroundColor),
          onPressed: () => _onTapped(index),
        ),
      ),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: () {
        if (_controller.isDismissed) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      backgroundColor: kThemeColor,
      tooltip: 'Add Item or Order',
      child: Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
      ),
      elevation: 4.0,
    );
  }

  void _onTapped(int index) {
    _controller.reverse();
    widget.onIconTapped(index);
    TextEditingController control = TextEditingController();
    if (index == 0) {
      int cnt = Provider.of<ProvideItems>(context, listen: false).itemCount + 1;
      Provider.of<ProvideItems>(context, listen: false).addToList(control);
      Provider.of<ProvideItems>(context, listen: false).addItem(
          OrderFormTextFields(
            count: cnt,
            control: control,
          ),
          index);
      print('0');
    } else if (index == 1) {
      Provider.of<ProvideItems>(context, listen: false)
          .addItem(OrderFormTextFields(), index);
      print('1');
    }
  }
}
