import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_tecnica/models/work_model.dart';
import 'package:prueba_tecnica/services/camera_acces.dart';
import 'package:prueba_tecnica/services/firebaseRepositories.dart';
import 'package:prueba_tecnica/services/gps_acces.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/widgetsdialogs.dart';

class WorkController {
  var repository = FirebaseRepository();

  late BuildContext context;
  var listworks = FirebaseFirestore.instance.collection('Tareas').snapshots();
  final description = TextEditingController();
  final coorx = TextEditingController();
  final coory = TextEditingController();
  bool active = false;
  bool completed = false;
  GlobalKey<FormState> formkey = GlobalKey();
  XFile? image = null;

  Future<void> addWork() async {
    dialog(
      context,
      'Registrando',
      'Estamos registrando sus datos',
      CircularProgressIndicator(
        color: EstiloApp.primarypurple,
      ),
      false,
    );
    bool result = await repository.addData(
        'Tareas',
        Work(
                active: active,
                completed: completed,
                descripcion: description.text,
                image: ' ',
                coorx: double.parse(coorx.text),
                coory: double.parse(coory.text),
                created_at: Timestamp.now(),
                updated_at: Timestamp.now(),
                id: '')
            .toMap(),
        image);
    Navigator.pop(context);
    if (result) {
      Navigator.pop(context);
    } else {
      dialog(
        context,
        'Error',
        'No se pudo registrar, rellena todos los campos y verifica tu conexion a internet',
        Icon(
          Icons.error,
          color: Color.fromARGB(255, 68, 13, 9),
          size: 50,
        ),
        true,
      );
    }
  }

  Future<void> delete(id) async {
    await repository.deleteData('Tareas', id);
    Navigator.pop(context);
  }

  Future<void> updatecompleted(id) async {
    print(id);
    await repository.updateData(
        'Tareas', id, {'completed': true, 'created-at': Timestamp.now()});
    Navigator.pop(context);
  }

  List<dynamic> enlist(data) {
    return data.docs.map((doc) => Work.fromMap(doc.data(), doc.id)).toList();
  }

  Future<void> getlatLong() async {
    dialog(
      context,
      'Cargando',
      'Obteniendo ubicaion',
      CircularProgressIndicator(
        color: EstiloApp.primarypurple,
      ),
      false,
    );
    var coors = await getPosition();
    if (coors != null) {
      coorx.text = coors.latitude.toString();
      coory.text = coors.longitude.toString();
    } else {}
    Navigator.pop(context);
  }

  Future<void> getFileImage(source) async {
    image = await pickImage(source);
  }

  updatecompleted2(bool bool, String id) {}
}
