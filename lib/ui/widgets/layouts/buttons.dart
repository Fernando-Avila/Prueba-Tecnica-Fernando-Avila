import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';

class BtnDegraded extends StatelessWidget {
  final Function() metod;
  final Widget widget;
  double? width;
  double? height;
  BtnDegraded(
      {Key? key,
      required this.metod,
      required this.widget,
      this.width,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      splashColor: EstiloApp.primarypurple,
      onTap: metod,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            gradient: EstiloApp.horizontalgradientpurpleblue,
            boxShadow: kElevationToShadow[9],
            borderRadius: BorderRadius.circular(60)),
        child: Center(child: widget),
      ),
    );
  }
}
