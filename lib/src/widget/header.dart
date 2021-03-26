import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Color(0xff33FFDE),
    );
  }
}

class HeaderBorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Color(0xff33FFDE),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          )),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      /* color: Color(0xff33FFDE), */
      child: CustomPaint(
        painter: _HeaderDiagolanlPainter(),
      ),
    );
  }
}

class _HeaderDiagolanlPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    /* propiedades */

    paint.color = Color(0xff33FFDE);
    /* paint.style = PaintingStyle.stroke; */ /*solo para bolder */
    paint.style = PaintingStyle.fill; /*solo para bolder */
    paint.strokeWidth = 2;
    final path = new Path();

    /* dibujar con el path y el paint */
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    /* path.lineTo(0, size.height * 0.5); */

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
