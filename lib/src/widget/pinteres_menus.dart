import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: _PinterestMenuBackround(
          child: _MenuItems(items),
        ),
      ),
    );
  }
}

class _PinterestMenuBackround extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackround({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
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
    final itemSelecionado = Provider.of<_MenuModel>(context).itemSelecionado;
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(item.icon,
            size: (itemSelecionado == index) ? 35 : 25,
            color: (itemSelecionado == index) ? Colors.red : Colors.blueGrey),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelecionado = 0;

  int get itemSelecionado => this._itemSelecionado;
  set itemSeleccionado(int index) {
    this._itemSelecionado = index;
    notifyListeners();
  }
}
