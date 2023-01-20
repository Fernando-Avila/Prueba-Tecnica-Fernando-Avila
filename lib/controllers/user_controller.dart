import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_tecnica/providers/authprovider.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/widgetsdialogs.dart';

class UserController {
  late BuildContext context;
  final email = TextEditingController();
  final pass = TextEditingController();
  bool visiblepass = false;
  GlobalKey<FormState> formkey = GlobalKey();
  Future login_user() async {
    if (formkey.currentState!.validate()) {
      try {
        //  await auth.FirebaseAuth.instance
        //     .signInWithEmailAndPassword(email: email.text, password: pass.text);
        AuthProvider().signInWithEmailAndPassword(email.text, pass.text);
        Navigator.pushNamedAndRemoveUntil(
            context, '/listworks', (route) => false);
      } catch (e) {
        dialog(
            context,
            'Incorrectó',
            'Credenciales incorrectas o no registradas, intenta de nuevo',
            Icon(Icons.error_outline,
                color: Color.fromARGB(255, 66, 12, 8), size: 50),
            true);
      }
    } else {
      print('no navega');
      // Navigator.pushNamed(context, '/listworks');
    }
  }
}
