import 'package:flutter/material.dart';

class CustomTextStyle extends TextStyle {
  CustomTextStyle()
      : super(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
}

class BodyTextStyle extends TextStyle {
  BodyTextStyle()
      : super(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
}

class ParagraphTextStyle extends TextStyle {
  ParagraphTextStyle()
      : super(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
}

class SubtitleTextStyle extends TextStyle {
  SubtitleTextStyle()
      : super(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        );
}

class TitleTextStyle extends TextStyle {
  TitleTextStyle()
      : super(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
}
