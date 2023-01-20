import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/controllers/work_controller.dart';
import 'package:prueba_tecnica/models/work_model.dart' as model;
import 'package:prueba_tecnica/ui/style/custom_styles.dart';
import 'package:prueba_tecnica/ui/widgets/layouts/widgettext.dart';

class Listworks extends StatefulWidget {
  const Listworks({Key? key}) : super(key: key);

  @override
  _ListworksState createState() => _ListworksState();
}

class _ListworksState extends State<Listworks> {
  WorkController _con = new WorkController();
  @override
  Widget build(BuildContext context) {
    _con.context = context;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: H3(
          text: 'Lista de tareas',
          color: EstiloApp.colorwhite,
        ),
        backgroundColor: EstiloApp.primaryblue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/listworks/create');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: body(),
    );
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
          opacity: 0.4,
          child: Container(
            decoration: BoxDecoration(
              gradient: EstiloApp.horizontalgradientpurpleblue,
            ),
          ),
        ),
        t2(
            text:
                'Desliza a la izquiera la tarea para compeltarla, o a la Derecha para eliminarla',
            color: EstiloApp.colorwhite),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: StreamBuilder(
            stream: _con.listworks,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final List<dynamic> docs = _con.enlist(snapshot.data);
                return SingleChildScrollView(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: docs.map((doc) => Work(doc)).toList(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: D2(
                      text:
                          'Existe un error en la conexion, consulta con el postulante'),
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: EstiloApp.primarypurple,
                ));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget Work(model.Work work) {
    return Dismissible(
        key: Key(work.id),
        confirmDismiss: (direction) {
          print(direction);
          return direction != DismissDirection.endToStart
              ? showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const H3(text: 'Confirmacion'),
                    content: const t1(text: 'Has completado la tarea?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => _con.updatecompleted(work.id),
                        child: const t1(text: 'Completár'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const t1(text: 'Cancelar'),
                      ),
                    ],
                  ),
                )
              : showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const H3(text: 'Confirmacion'),
                    content:
                        const t1(text: 'Estas seguro de eliminar esta tarea?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => _con.delete(work.id),
                        child: const t1(text: 'Eliminar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const t1(text: 'Cancelar'),
                      ),
                    ],
                  ),
                );
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(9),
              child: CachedNetworkImage(
                imageUrl: work.image,
                httpHeaders: const {
                  'content-type': 'application/json',
                  'accept': 'application/json',
                  "connection": "Keep-Alive",
                },
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: kElevationToShadow[9]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      H3(
                        text: work.descripcion,
                        color: EstiloApp.colorwhite,
                        fontWeight: FontWeight.w400,
                      ),
                      t2(
                        text: work.completed ? 'Completada' : 'Incompleta',
                        color: EstiloApp.colorwhite,
                      ),
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        work.active
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    color: Color.fromARGB(255, 78, 243, 84),
                                  ),
                                  t3(
                                    text: 'Activa',
                                    color: EstiloApp.colorwhite,
                                  )
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  const Icon(
                                    Icons.cancel,
                                    color: Color.fromARGB(255, 119, 22, 22),
                                  ),
                                  t3(
                                    text: 'Inactiva',
                                    color: EstiloApp.colorwhite,
                                  )
                                ],
                              ),
                        H3(
                          text: time(work.created_at),
                          color: EstiloApp.colorwhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

String time(Timestamp created_at) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
  return DateFormat().add_jm().format(created_at.toDate());
  ;
}
