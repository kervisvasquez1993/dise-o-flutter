import 'package:appredvital/src/models/slider_model.dart';
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
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              if (this.puntosArribas)
                _Dots(
                  this.slides.length,
                  this.colorPrimario,
                  this.colorSecundario,
                ),
              Expanded(child: _Slider(this.slides)),
              if (!this.puntosArribas)
                _Dots(
                  this.slides.length,
                  this.colorPrimario,
                  this.colorSecundario,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlider;
  final Color colorPrimario;
  final Color colorSecundario;
  _Dots(this.totalSlider, this.colorPrimario, this.colorSecundario);
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
                  this.colorPrimario,
                  this.colorSecundario,
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
  final colorPrimario;
  final Color colorSecundario;
  _Dot(this.index, this.colorPrimario, this.colorSecundario);
  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? this.colorPrimario
            : this.colorSecundario,
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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
