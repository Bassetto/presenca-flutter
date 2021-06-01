import 'package:flutter/material.dart';
import 'package:presenca/app/views/chamada_extra_view.dart';
import 'package:presenca/app/views/chamada_view.dart';
import 'package:presenca/app/views/home_view.dart';

import 'app/views/chamada_details_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presença',
      theme: ThemeData.dark(),
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text("Deu erro")),
          ),
        );
      },
      routes: {
        "/": (context) => Home(),
        "chamada": (context) => Chamada(),
        "chamadaExtra": (context) => ChamadaExtra(),
        "chamadaDetalhes": (context) => ChamadaDetalhes(),
        "alunos": (context) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text("alunos")),
            ),
        "professores": (context) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text("Professores")),
            ),
        "gerencial": (context) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text("Gerencial")),
            ),
      },
    );
  }
}
