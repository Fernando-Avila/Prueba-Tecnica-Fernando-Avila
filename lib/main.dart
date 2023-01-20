import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/providers/authprovider.dart';
import 'package:prueba_tecnica/ui/screens/Login.dart';
import 'package:prueba_tecnica/ui/screens/creatework.dart';
import 'package:prueba_tecnica/ui/screens/listworks.dart';
import 'package:prueba_tecnica/ui/style/custom_styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CollectionReference chat = FirebaseFirestore.instance.collection('tareas');
    final Stream<DocumentSnapshot<Object?>> documents = chat.doc().snapshots();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Prueba Tecnica',
        theme: ThemeData(
          primaryColor: EstiloApp.primarypurple,
          unselectedWidgetColor: EstiloApp.colorwhite,
          toggleableActiveColor: EstiloApp.primarypurple,
        ),
        routes: {
          '/': (context) => Login(),
          '/listworks': (context) => Listworks(),
          '/listworks/create': (context) => Creatework(),
        },
        initialRoute: '/',
      ),
    );
  }
}
