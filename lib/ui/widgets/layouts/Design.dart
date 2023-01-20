import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/logo.png',
      fit: BoxFit.fill,
      height: height,
    );
  }
}
