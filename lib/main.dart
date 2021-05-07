import 'package:appredvital/src/pages/animaciones_pages.dart';
import 'package:appredvital/src/labs/circular_progress_page.dart';
import 'package:appredvital/src/pages/graficas_circulares_page.dart';
import 'package:appredvital/src/pages/header_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseño app',
      home: Scaffold(body: GraficaCircularPage()),
    );
  }
}
