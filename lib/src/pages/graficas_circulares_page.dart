import 'package:appredvital/src/widget/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficaCircularPage extends StatefulWidget {
  @override
  _GraficaCircularPageState createState() => _GraficaCircularPageState();
}

class _GraficaCircularPageState extends State<GraficaCircularPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(
            porcentaje: porcentaje,
          ),
        ),
      ), // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0))),
    );
  }
}
