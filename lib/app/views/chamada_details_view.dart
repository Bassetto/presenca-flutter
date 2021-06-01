import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:presenca/app/core/app_text_styles.dart';
import 'package:presenca/app/model/chamada_model.dart';

class ChamadaDetalhes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ChamadaModel chamada = ModalRoute.of(context).settings.arguments;
    double espacamento = 15.0;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          Text(
            "Disciplina: ${chamada.disciplina}",
            style: AppTextStyles.title,
          ),
          SizedBox(height: espacamento),
          Text(
            "Turma: ${chamada.turma}",
            style: AppTextStyles.heading,
          ),
          SizedBox(height: espacamento),
          Text(
            "Horário de inicio: ${chamada.horarioInicio}",
            style: AppTextStyles.heading,
          ),
          SizedBox(height: espacamento),
          Text(
            "Horário de término: ${chamada.horarioTermino}",
            style: AppTextStyles.heading,
          ),
          SizedBox(height: espacamento),
          Text(
            "Quantidade de alunos: ${chamada.qtdAlunos}",
            style: AppTextStyles.heading,
          ),
          (chamada.qtdPresentes == null) ? SizedBox() : SizedBox(height: espacamento),
          (chamada.qtdPresentes == null)
              ? Text("")
              : Text(
                  "Quantidade de alunos presentes: ${chamada.qtdPresentes}",
                  style: AppTextStyles.heading,
                ),
          (chamada.qtdAusentes == null) ? SizedBox() : SizedBox(height: espacamento),
          (chamada.qtdAusentes == null)
              ? SizedBox()
              : Text(
                  "Quantidade de alunos presentes: ${chamada.qtdAusentes}",
                  style: AppTextStyles.heading,
                ),
          SizedBox(height: espacamento),
          Text(
            "Status: ${chamada.status}",
            style: AppTextStyles.getStatusStyle(chamada.status),
          ),
          SizedBox(height: espacamento),
          Text(
            "Tipo: ${chamada.tipo.capitalize()}",
            style: AppTextStyles.heading,
          ),
          SizedBox(height: espacamento),
          Text(
            DateFormat("'Data da chamada: ' dd/MM/yyyy").format(chamada.data),
            style: AppTextStyles.heading,
          ),
          (chamada.dataFinalizado == null) ? SizedBox() : SizedBox(height: espacamento),
          (chamada.dataFinalizado == null)
              ? SizedBox()
              : Text(
                  DateFormat("'Data em que a chamada foi finalizada: ' dd/MM/yyyy").format(chamada.dataFinalizado),
                  style: AppTextStyles.heading,
                ),
        ],
      ),
    );
  }
}
