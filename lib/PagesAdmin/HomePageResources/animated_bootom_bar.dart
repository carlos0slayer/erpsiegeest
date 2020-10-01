import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;

  AnimatedBottomBar({
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 500),
    this.onBarTap,
  });
  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Color.fromRGBO(30, 30, 46, 3),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 24.0, top: 8.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          duration: widget.animationDuration,
          decoration: BoxDecoration(
              color: isSelected
                  ? item.color.withOpacity(0.40)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              Icon(
                item.iconos,
                color: isSelected ? item.color : Colors.white,
                size: 20.0,
              ),
              SizedBox(
                width: 5.0,
              ),
              AnimatedSize(
                duration: widget.animationDuration,
                curve: Curves.easeInOut,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(
                    color: item.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return _barItems;
  }
}

class BarItem {
  String text;
  IconData iconos;
  Color color;
  BarItem({this.text, this.iconos, this.color});
}
