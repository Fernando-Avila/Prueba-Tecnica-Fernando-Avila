import 'package:flutter/material.dart';

class D1 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const D1(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
          fontWeight: fontWeight ??
              Theme.of(context).textTheme.displayLarge!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.displayLarge!.color),
    );
  }
}

class D2 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const D2(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.displayMedium!.fontSize,
          fontWeight: fontWeight ??
              Theme.of(context).textTheme.displayMedium!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.displayMedium!.color),
    );
  }
}

class D3 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const D3(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
          fontWeight: fontWeight ??
              Theme.of(context).textTheme.displaySmall!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.displaySmall!.color),
    );
  }
}

class H1 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const H1(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
          fontWeight: fontWeight ??
              Theme.of(context).textTheme.headlineLarge!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.headlineLarge!.color),
    );
  }
}

class H2 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const H2(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
          fontWeight: fontWeight ??
              Theme.of(context).textTheme.headlineMedium!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.headlineMedium!.color),
    );
  }
}

class H3 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const H3(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
          fontWeight: fontWeight ??
              Theme.of(context).textTheme.headlineSmall!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.headlineSmall!.color),
    );
  }
}

class t1 extends StatelessWidget {
  final dynamic text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const t1(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.titleLarge!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}

class t2 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const t2(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.titleMedium!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.titleMedium!.color),
    );
  }
}

class t3 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const t3(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.titleSmall!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.titleSmall!.color),
    );
  }
}

class l1 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const l1(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.labelLarge!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.labelLarge!.color),
    );
  }
}

class l2 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const l2(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.labelMedium!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.labelMedium!.color),
    );
  }
}

class l3 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const l3(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.labelSmall!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.labelSmall!.color),
    );
  }
}

class b1 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const b1(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.bodyLarge!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.bodyLarge!.color),
    );
  }
}

class b2 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const b2(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.bodyMedium!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.bodyMedium!.color),
    );
  }
}

class b3 extends StatelessWidget {
  final String text;
  final MaterialColor? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  const b3(
      {super.key,
      required this.text,
      this.color,
      this.fontStyle,
      this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.bodySmall!.fontWeight,
          fontStyle: fontStyle,
          color: color ?? Theme.of(context).textTheme.bodySmall!.color),
    );
  }
}
