import 'package:flutter/material.dart';

class PinteresMenu extends StatelessWidget {
  final List<PinteresButton> items = [
    PinteresButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('icon pie');
        }),
    PinteresButton(
        icon: Icons.search,
        onPressed: () {
          print('icon pie222');
        }),
    PinteresButton(
        icon: Icons.notifications,
        onPressed: () {
          print('icon pie2223333');
        }),
    PinteresButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('icon pie333');
        }),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: _MenuItems(items),
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: -5,
              )
            ]),
      ),
    );
  }
}

class PinteresButton {
  final Function onPressed;
  final IconData icon;
  PinteresButton({this.onPressed, this.icon});
}

class _MenuItems extends StatelessWidget {
  final List<PinteresButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuBotton(index, menuItems[index])));
  }
}

class _PinterestMenuBotton extends StatelessWidget {
  final int index;
  final PinteresButton item;

  _PinterestMenuBotton(this.index, this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(item.icon),
    );
  }
}
