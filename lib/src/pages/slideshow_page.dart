import 'package:appredvital/src/widget/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidershowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: MySlideShow()),
        Expanded(child: MySlideShow()),
      ],
    );
  }
}

class MySlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slideshow(
        bullerPrimario: 15,
        bullerSecundario: 12,
        puntosArribas: false,
        slides: <Widget>[
          SvgPicture.asset('assets/svg/slide-1.svg'),
          SvgPicture.asset('assets/svg/slide-2.svg'),
          SvgPicture.asset('assets/svg/slide-3.svg'),
          SvgPicture.asset('assets/svg/slide-4.svg'),
        ],
        colorPrimario: Colors.red,
        colorSecundario: Colors.purple,
      ),
    );
  }
}
