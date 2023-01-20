import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:prueba_tecnica/controllers/work_controller.dart';

import 'package:prueba_tecnica/ui/style/custom_styles.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/Textfield.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/buttons.dart';

import 'package:prueba_tecnica/ui/widgets/layouts/widgettext.dart';

class Creatework extends StatefulWidget {
  const Creatework({Key? key}) : super(key: key);

  @override
  _CreateworkState createState() => _CreateworkState();
}

class _CreateworkState extends State<Creatework> {
  WorkController _con = new WorkController();
  @override
  Widget build(BuildContext context) {
    _con.context = context;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: EstiloApp.primaryblue,
          title: H3(
            text: 'Crear una tarea',
            color: EstiloApp.colorwhite,
          ),
          automaticallyImplyLeading: false,
        ),
        body: body());
  }

  Widget body() {
    return Stack(
      children: [
        Image.asset(
          'assets/img/fondo_cod.jpg',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
        ),
        Opacity(
          opacity: 0.5,
          child: Container(
            decoration: BoxDecoration(
                gradient: EstiloApp.horizontalgradientpurpleblue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5))
                ]),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(20),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
              ]),
          child: Form(
            key: _con.formkey,
            child: ListView(
              children: [
                Textfield(
                    placeholder: 'Descripcion',
                    prefixicon: Icon(
                      Icons.abc,
                      color: EstiloApp.colorwhite,
                    ),
                    controlador: _con.description,
                    color: EstiloApp.colorwhite),
                t1(
                  text: 'Coordenadas',
                  color: EstiloApp.colorwhite,
                ),
                BtnDegraded(
                    metod: () async {
                      _con.getlatLong();
                    },
                    widget: t3(
                      text: 'Obtener Coordenadas',
                      color: EstiloApp.colorwhite,
                    )),
                sz(),
                Textfield(
                    readonly: true,
                    prefixicon: Icon(
                      Icons.location_pin,
                      color: EstiloApp.colorwhite,
                    ),
                    placeholder: 'Coordenada X',
                    controlador: _con.coorx,
                    inputType: TextInputType.number,
                    color: EstiloApp.colorwhite),
                Textfield(
                  readonly: true,
                  placeholder: 'Coordenada Y',
                  prefixicon: Icon(
                    Icons.location_pin,
                    color: EstiloApp.colorwhite,
                  ),
                  controlador: _con.coory,
                  color: EstiloApp.colorwhite,
                  inputType: TextInputType.number,
                ),
                sz(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        t2(
                          text: 'Activo',
                          color: EstiloApp.colorwhite,
                        ),
                        Checkbox(
                            value: _con.active,
                            onChanged: (value) {
                              _con.active = value!;
                              setState(() {});
                            }),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        t2(text: 'Completada', color: EstiloApp.colorwhite),
                        Checkbox(
                            value: _con.completed,
                            onChanged: (value) {
                              _con.completed = value!;
                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: EstiloApp.colorwhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: kElevationToShadow[2],
                      border: Border.all(width: 0.05)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        color: Colors.white,
                        child: _con.image == null
                            ? Container(
                                // color: EstiloApp.colorblack,
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 10),
                                child: Image.asset(
                                  'assets/img/galeria2.png',
                                  fit: BoxFit.fitWidth,
                                ))
                            : Padding(
                                padding: EdgeInsets.only(top: 40, bottom: 10),
                                child: Image.file(
                                  File(_con.image!.path),
                                ),
                              ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            const Expanded(
                                child: H2(
                              text: 'Imagen',
                              fontWeight: FontWeight.bold,
                            )),
                            InkWell(
                              onTap: () async {
                                await _con.getFileImage(ImageSource.gallery);
                                setState(() {});
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 20, right: 10),
                                child: Icon(
                                  Icons.file_upload,
                                  size: 40,
                                  color: EstiloApp.primarypurple,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await _con.getFileImage(ImageSource.camera);
                                setState(() {});
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 10.0, right: 10.0),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: EstiloApp.primaryblue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                sz(),
                t3(
                  text: 'La hora de creacion y actualizacíon sera automatica',
                  color: EstiloApp.colorwhite,
                ),
                sz(),
                BtnDegraded(
                    width: 0.4,
                    metod: () {
                      _con.addWork();
                    },
                    widget: H3(
                        text: 'Registrar Tarea',
                        color: EstiloApp.colorwhite,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget sz() {
    return SizedBox(
      height: 10,
    );
  }
}
