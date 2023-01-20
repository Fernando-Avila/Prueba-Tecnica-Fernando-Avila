import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prueba_tecnica/controllers/user_controller.dart';
import 'package:prueba_tecnica/services/function.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';
import 'package:prueba_tecnica/ui/style/text_custom_style.dart';
import 'dart:ui' as ui show Image;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:prueba_tecnica/ui/widgets/exportlayouts.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/Textfield.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/buttons.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/widgettext.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  UserController _con = new UserController();
  late final AnimationController _animatedcontroller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      reverseDuration: const Duration(milliseconds: 400));
  late final AnimationController _animatedkeyboardcontroller =
      AnimationController(
          duration: const Duration(milliseconds: 300),
          vsync: this,
          animationBehavior: AnimationBehavior.preserve,
          reverseDuration: const Duration(milliseconds: 400));
  late Animation _animationslide;
  late Animation _animationopacity;
  late Animation _animationkeyboard;
  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    // TODO: implement initState
    var keyboardVisibilityController = KeyboardVisibilityController();
    _animationslide = Tween<double>(begin: 0, end: 0.5).animate(CurvedAnimation(
        curve: Curves.bounceOut,
        parent: _animatedcontroller,
        reverseCurve: Curves.easeInBack));
    _animationopacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: _animatedcontroller));
    _animatedcontroller.forward();
    _animationkeyboard = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            curve: Curves.fastOutSlowIn, parent: _animatedkeyboardcontroller));
    _animatedcontroller.forward();
    super.initState();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) async {
      if (visible) {
        await _animatedkeyboardcontroller.forward();
      } else {
        await _animatedkeyboardcontroller.reverse();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animatedcontroller.dispose();
    _animatedkeyboardcontroller.dispose();
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _con.context = context;
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return AnimatedBuilder(
      animation:
          Listenable.merge([_animatedcontroller, _animatedkeyboardcontroller]),
      builder: (context, child) => Stack(
        children: [
          Opacity(
            opacity: _animationopacity.value,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/img/fondo_cod.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Opacity(
              opacity: _animationopacity.value / 2.5,
              child: Container(
                decoration: BoxDecoration(
                    gradient: EstiloApp.horizontalgradientpurpleblue),
              )),
          AnimatedSlide(
            offset: Offset(_animationkeyboard.isCompleted ? -1 : 3, 1),
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceInOut,
            child: Opacity(
              opacity: _animationopacity.value,
              child: Image.asset(
                'assets/img/blog.png',
                fit: BoxFit.fill,
                height: 100,
              ),
            ),
          ),
          AnimatedSlide(
            offset: Offset(_animationkeyboard.isCompleted ? 5 : 0.2, 0.5),
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceInOut,
            child: Opacity(
              opacity: _animationopacity.value,
              child: const Logo(height: 150),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: CutomFooterPainter(hg: _animationslide.value),
            ),
          ),
          Positioned(
              top:
                  MediaQuery.of(context).size.height * (_animationslide.value) -
                      (_animationkeyboard.value * 150),
              child: Opacity(
                opacity: _animationopacity.value,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _con.formkey,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.start,
                      children: [
                        H1(text: 'Bienvenido!', color: EstiloApp.colorwhite),
                        Textfield(
                          controlador: _con.email,
                          inputType: TextInputType.emailAddress,
                          hintext: 'testtodo@icreativa.com.ec',
                          validator: (value) {
                            return emailvalidator(value!);
                          },
                          prefixicon: Tooltip(
                            message:
                                'El correo autorizado es: testtodo@icreativa.com.ec',
                            child: Icon(
                              Icons.email,
                              color: EstiloApp.colorwhite,
                            ),
                          ),
                          placeholder: 'Correo:',
                          color: EstiloApp.colorwhite,
                        ),
                        Textfield(
                          controlador: _con.pass,
                          hintext: 'testtodo',
                          color: EstiloApp.colorwhite,
                          obscuretext: _con.visiblepass,
                          placeholder: 'Clave',
                          validator: (value) {
                            return passvalidator(value!);
                          },
                          prefixicon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _con.visiblepass = !_con.visiblepass;
                                });
                              },
                              icon: Icon(
                                _con.visiblepass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: EstiloApp.colorwhite,
                              )),
                        ),
                        BtnDegraded(
                            metod: () {
                              _con.login_user();
                            },
                            widget: H3(
                              text: 'Login',
                              color: EstiloApp.colorwhite,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
