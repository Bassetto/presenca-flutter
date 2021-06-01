import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presenca/app/core/app_text_styles.dart';
import 'package:presenca/app/model/chamada_model.dart';
import 'package:presenca/app/repository/chamadas_repository.dart';

import 'loading_widget.dart';

class ChamadasListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChamadaModel>>(
        future: ChamadasRepository().findAll(),
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
      shrinkWrap: true,
      physics: ScrollPhysics(),
      // reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, idx) {
        int index = chamadas.length - 1 - idx;
        Color statusColor = Colors.purpleAccent;
        if (chamadas[index].status.toLowerCase() == "publicado") {
          statusColor = Colors.green;
        }
        return Card(
          child: ListTile(
            leading: RichText(
              text: TextSpan(
                text: chamadas[index].turma,
                style: AppTextStyles.body,
                children: <TextSpan>[
                  TextSpan(text: "\n\n${chamadas[index].tipo.capitalize()}"),
                ]
              ),
            ),
            title: Text(chamadas[index].disciplina),
            subtitle: Text(
                DateFormat("'Data: ' dd/MM/yyyy").format(chamadas[index].data)),
            trailing: RichText(
              text: TextSpan(text: "Status\n", children: <TextSpan>[
                TextSpan(
                    text: chamadas[index].status,
                    style: TextStyle(color: statusColor)),
              ]),
            ),
            onTap: () => Navigator.of(context).pushNamed("chamadaDetalhes", arguments: chamadas[index]),
          ),
        );
      },
    );
  }
}
