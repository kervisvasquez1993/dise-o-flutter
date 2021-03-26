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

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      /* color: Color(0xff33FFDE), */
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    /* propiedades */

    paint.color = Color(0xff33FFDE);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final path = new Path();

    /* ejemplo 1 */
    /* dibujar con el path y el paint */
    /*   path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0); */

    /* ejemplo 2 */
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Header3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      /* color: Color(0xff33FFDE), */
      child: CustomPaint(
        painter: _Header3Painter(),
      ),
    );
  }
}

class _Header3Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    /* propiedades */

    paint.color = Color(0xff33FFDE);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final path = new Path();

    /* ejemplo 1 */
    /* dibujar con el path y el paint */
    /*   path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0); */

    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width * 0.50, size.height * 0.37);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Header4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      /* color: Color(0xff33FFDE), */
      child: CustomPaint(
        painter: _Header4Painter(),
      ),
    );
  }
}

class _Header4Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    /* propiedades */

    paint.color = Color(0xff33FFDE);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final path = new Path();
    path.lineTo(0, size.height * 0.30);
    /* path.lineTo(size.width, size.height * 0.30); */
    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.50, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Header5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      /* color: Color(0xff33FFDE), */
      child: CustomPaint(
        painter: _Header5Painter(),
      ),
    );
  }
}

class _Header5Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    /* propiedades */

    paint.color = Color(0xff33FFDE);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;
    final path = new Path();
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.30);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
