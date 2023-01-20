import 'package:flutter/rendering.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';

enum painttype { color, shadow }

class CutomFooterPainter extends CustomPainter {
  final double hg;

  CutomFooterPainter({required this.hg});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = EstiloApp.colorwhite;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    paint.color = EstiloApp.colorwhite;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * hg);
    path.quadraticBezierTo(size.width * 0.4, size.height * (hg - 0.1),
        size.width * 0.7, size.height * hg);
    path.quadraticBezierTo(size.width * 0.9, size.height * (hg + 0.07),
        size.width, size.height * (hg + 0.05));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    //path.close();
    //canvas.clipPath(path);

    //canvas.clipPath(path);
    AssetImage image = AssetImage('assets/img/fondo_cod.jpg');

    //canvas.drawImage(img, Offset.zero, paint);
//    canvas.drawPath(path, paint);

    // ui.Image img = Image(image: AssetImage('assets/img/fondo_cod.jpg'));
    canvas.drawShadow(path, EstiloApp.primarypurple, 0, true);
    // canvas.drawImage(img, Offset.zero, paint);
  }

  @override
  bool shouldRepaint(CutomFooterPainter oldDelegate) => true;
}
