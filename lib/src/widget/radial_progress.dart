import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorArco;
  double grosorArco;
  double grosorProgress;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorArco = Colors.grey,
    this.grosorArco = 5,
    this.grosorProgress,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

// inicializamos controlador
  @override
  void initState() {
    // TODO: implement initState
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferencia = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            // child: Text('${widget.porcentaje}'),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                (widget.porcentaje - diferencia) +
                    (diferencia * controller.value),
                widget.colorPrimario,
                widget.colorArco,
                widget.grosorArco,
                widget.grosorProgress,
              ),
            ),
          );
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorArco;
  double grosorArco;
  double grosorProgress;
  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorArco,
    this.grosorArco,
    this.grosorProgress,
  );
  @override
  void paint(Canvas canvas, Size size) {
    //circular completado
    final paint = new Paint()
      ..strokeWidth = grosorArco
      ..color = colorArco
      ..style = PaintingStyle.stroke;
    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //arco
    final paintArco = new Paint()
      ..strokeWidth = grosorProgress
      ..strokeCap = StrokeCap.round
      ..color = colorPrimario
      ..style = PaintingStyle.stroke;

    //parte que se debe llenar

    double arcAngle = 2 * pi * (porcentaje / 100);
    //DIBUJAR EL ARCO ]
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
