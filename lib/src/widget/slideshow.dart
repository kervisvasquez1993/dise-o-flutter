import 'package:flutter/material.dart';

//TODO; BORRAR

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArribas;
  final Color colorPrimario;
  final Color colorSecundario;
  Slideshow(
      {@required this.slides,
      this.puntosArribas = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderShowModel>(context).colorPrimario =
                  this.colorPrimario;
              Provider.of<_SliderShowModel>(context).colorSecundario =
                  this.colorSecundario;

              return _CrearEstructuraSlideshow(
                  puntosArribas: puntosArribas, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    Key key,
    @required this.puntosArribas,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArribas;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.puntosArribas)
          _Dots(
            this.slides.length,
          ),
        Expanded(child: _Slider(this.slides)),
        if (!this.puntosArribas)
          _Dots(
            this.slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlider;

  _Dots(
    this.totalSlider,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            this.totalSlider,
            (index) => _Dot(
                  index,
                )),
        // children: <Widget>[
        //   _Dot(0),
        //   _Dot(1),
        //   _Dot(2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);
  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SliderShowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: (ssModel._currentPage >= index - 0.5 &&
                ssModel._currentPage < index + 0.5)
            ? ssModel._colorPrimario
            : ssModel._colorSecundario,
        shape: BoxShape.circle,
      ),
    );
  }
}

// SvgPicture.asset('assets/svg/slide-1.svg')
class _Slider extends StatefulWidget {
  final List<Widget> slides;
  _Slider(this.slides);
  @override
  __SliderState createState() => __SliderState();
}

class __SliderState extends State<_Slider> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double get currentPage => this._currentPage;
// getter para obtener valor
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    this._colorPrimario = color;
    notifyListeners();
  }

  Color get colorsecundario => _colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
    notifyListeners();
  }
}
