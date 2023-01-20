import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/widgettext.dart';

void dialog(BuildContext context, String title, String text, Widget widget, bool dismiss) {
  showDialog<String>(
     barrierDismissible: dismiss,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: EdgeInsets.all(25),
      insetPadding: const EdgeInsets.all(50),
      title: H2(text: title, color: EstiloApp.primaryblue),
      content: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //iconChargue
            widget,
            t1(text: text, color: EstiloApp.primarypurple),
          ],
        ),
      ),
    ),
  );
}
