import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/widgettext.dart';

class Textfield extends StatelessWidget {
  final String? placeholder;
  final TextInputType? inputType;
  final TextEditingController controlador;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autovalidmode;
  final String? hintext;
  final bool? readonly;
  final bool? obscuretext;
  final Function()? ontap;
  final Function(String?)? onchange;
  final Widget? prefixicon;
  final Widget? suffixicon;
  final String? Function(String?)? validator;
  final Color color;
  const Textfield(
      {super.key,
      this.placeholder,
      this.inputType,
      required this.controlador,
      this.textCapitalization,
      this.hintext,
      this.readonly,
      this.obscuretext,
      this.ontap,
      this.onchange,
      this.prefixicon,
      this.suffixicon,
      this.validator,
      this.autovalidmode,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            prefixicon != null
                ? Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: color, width: 2)),
                    child: prefixicon,
                  )
                : SizedBox(),
            Expanded(
              child: TextFormField(
                textInputAction: TextInputAction.next,
                autovalidateMode:
                    autovalidmode ?? AutovalidateMode.onUserInteraction,
                validator: validator ??
                    ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo requerido';
                      }
                      return null;
                    }),
                onTap: ontap,
                keyboardType: inputType,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.words,
                controller: controlador,
                autofocus: false,
                onChanged: onchange,
                readOnly: readonly ?? false,
                cursorColor: EstiloApp.primarypurple,
                obscureText: obscuretext ?? false,
                style: TextStyle(
                    color: color, fontSize: 18, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: hintext,
                    hintStyle: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    label: t1(
                      text: placeholder ?? '',
                      color: color as MaterialColor,
                    ),
                    errorStyle: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                    suffixIcon: suffixicon ?? null,
                    errorMaxLines: 1,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: color, width: 2),
                        borderRadius: BorderRadius.circular(60)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: EstiloApp.primarypurple, width: 2),
                        borderRadius: BorderRadius.circular(60)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: color, width: 2),
                        borderRadius: BorderRadius.circular(60)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: EstiloApp.primarypurple, width: 4),
                        borderRadius: BorderRadius.circular(60)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: color, width: 2),
                        borderRadius: BorderRadius.circular(60))),
              ),
            ),
          ],
        ));
  }
}
