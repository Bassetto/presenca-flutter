import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presenca/app/model/chamada_model.dart';
import 'package:presenca/app/repository/chamadas_repository.dart';

import 'loading_widget.dart';

class ChamadasHojeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChamadaModel>>(
        future: ChamadasRepository().findToday(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return LoadingWidget();
          }
        });
  }
  ListView buildListView(List<ChamadaModel> chamadas) {
    return ListView.builder(
      itemCount: chamadas == null ? 0 : chamadas.length,
      physics: ScrollPhysics(),
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        String periodo = "";
        if (chamadas[index].horarioInicio == "08:00" || chamadas[index].horarioInicio == "10:00") {
          periodo = "Matutino";
        } else {
          periodo = "Noturno";
        }
        return Card(
          child: ListTile(
            leading: Text(chamadas[index].turma),
            title: Text(chamadas[index].disciplina),
            subtitle: Text(DateFormat("'Data: ' dd/MM/yyyy").format(chamadas[index].data)),
            trailing: RichText(
              text: TextSpan(
                  text: "$periodo\n",
                  children: <TextSpan>[
                    TextSpan(text: chamadas[index].horarioInicio),
                    TextSpan(text: " - "),
                    TextSpan(text: chamadas[index].horarioTermino)
                  ]
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed("chamada", arguments: chamadas[index]),
          ),
        );
      },
    );
  }
}
