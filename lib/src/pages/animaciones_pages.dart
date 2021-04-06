import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller; /* ejemplo de la barra de youtube    */
  Animation<double> rotation;

  /* inicializar  */

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2 * Math.pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInBack));

    /* add listener */
    controller.addListener(() {
      print("status ${controller.status}");
      if (controller.status == AnimationStatus.completed) {
        /* controller.reverse(); */
        controller.reset();
      }
    });
    controller.forward();
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
    /* reproduccion */
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      /* child: _Rectangulo(), */
      builder: (BuildContext context, Widget child) {
        print(rotation.value);
        return Transform.rotate(angle: rotation.value, child: _Rectangulo());
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
