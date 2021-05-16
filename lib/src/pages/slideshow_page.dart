import 'package:appredvital/src/widget/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlidershowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Slideshow(slides: <Widget>[
      SvgPicture.asset('assets/svg/slide-1.svg'),
      SvgPicture.asset('assets/svg/slide-2.svg'),
      SvgPicture.asset('assets/svg/slide-3.svg'),
      SvgPicture.asset('assets/svg/slide-4.svg'),
    ]));
  }
}
