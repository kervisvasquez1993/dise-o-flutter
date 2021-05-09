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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.grey,
                grosoProgress: 7,
                grosorArco: 5,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.purple,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.yellow,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.green,
              ),
            ],
          ),
        ],
      ), // child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0))),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color colorPrimario;
  final colorArco;
  final double grosorArco;
  final double grosoProgress;
  const CustomRadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorArco = Colors.red,
    this.grosoProgress = 10,
    this.grosorArco = 10,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorArco: colorArco,
        grosorArco: grosorArco,
        grosorProgress: grosoProgress,
      ),
    );
  }
}
