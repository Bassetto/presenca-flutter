import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:presenca/app/components/loading_widget.dart';
import 'package:presenca/app/core/app_images.dart';
import 'package:presenca/app/core/app_text_styles.dart';
import 'package:presenca/app/model/aluno_model.dart';
import 'package:presenca/app/model/chamada_model.dart';
import 'package:presenca/app/repository/chamadas_repository.dart';

class Chamada extends StatefulWidget {
  const Chamada({Key key}) : super(key: key);

  @override
  _ChamadaState createState() => _ChamadaState();
}

class _ChamadaState extends State<Chamada> {
  AlunoModel _alunoSelecionado = AlunoModel(0, "", "");
  Future<List<AlunoModel>> _future = ChamadasRepository().findAlunos();
  List<AlunoModel> _alunos = [];
  int _presentes = 0;
  int _ausentes = 0;
  int _qtAlunos = 0;
  String _dropdownValue = "Chamada";
  TextEditingController _infoController;

  @override
  void initState() {
    _future.then((value) {
      setState(() {
        _alunos.addAll(value);
        _qtAlunos = value.length;
        _alunoSelecionado = value[0];
      });
    });
    _infoController = TextEditingController();
    super.initState();
  }
  @override
  dispose() {
    _infoController.dispose();
    super.dispose();
  }

  _setStatus(String status) {
    for (int i = 0; i < _alunos.length; i++) {
      if (_alunos[i].rm == _alunoSelecionado.rm &&
          _alunos[i].status != status) {
        _updateContagem(status, _alunos[i].status);
        setState(() {
          _alunos[i].status = status;
        });
        _getProximoAluno(i);
        break;
      }
    }
  }

  _getProximoAluno(int index) {
    if (!(_alunos.length - 1 == index)) {
      setState(() {
        _alunoSelecionado = _alunos[index + 1];
      });
    }
  }

  _updateContagem(String status, String statusAnterior) {
    if (status == "presente") {
      setState(() {
        _presentes++;
      });
    } else {
      setState(() {
        _ausentes++;
      });
    }
    if (statusAnterior == "") {
    } else if (statusAnterior == "presente") {
      setState(() {
        _presentes--;
      });
    } else if (statusAnterior == "ausente") {
      setState(() {
        _ausentes--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ChamadaModel chamada = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: RichText(
                text: TextSpan(
                    text: chamada.turma,
                    style: AppTextStyles.body,
                    children: <TextSpan>[
                      TextSpan(text: "\n\n${chamada.tipo.capitalize()}"),
                    ]),
              ),
              title: Text(chamada.disciplina),
              subtitle: Text(DateFormat("'Data e hora: ' dd/MM/yyyy hh:mm")
                  .format(chamada.data)),
              trailing: RichText(
                text: TextSpan(text: "Status\n", children: <TextSpan>[
                  TextSpan(
                    text: chamada.status,
                    style: AppTextStyles.getStatusStyle(chamada.status),
                  ),
                ]),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Qt. Alunos: $_qtAlunos",
                style: AppTextStyles.body,
              ),
              Text(
                "Presentes: $_presentes",
                style: AppTextStyles.presentes,
              ),
              Text(
                "Ausentes: $_ausentes",
                style: AppTextStyles.ausentes,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.asset(
              AppImages.personUnknow,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("RM: ${_alunoSelecionado.rm}", style: AppTextStyles.body,),
              Text("Nome: ${_alunoSelecionado.nome}", style: AppTextStyles.body,),
              Text("Status: ${_alunoSelecionado.status}", style: AppTextStyles.body,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  _setStatus("ausente");
                },
                child: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  _setStatus("presente");
                },
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("RM", style: AppTextStyles.body,),
              Text("Nome", style: AppTextStyles.body,),
              Text("Status", style: AppTextStyles.body,),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<AlunoModel>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return buildListView(snapshot.data);
                  } else {
                    return LoadingWidget();
                  }
                }),
          ),
          Expanded(
            child: ListView(
              physics: ScrollPhysics(),
              padding: const EdgeInsets.all(10),
              children: [
                Text("Finalização da chamada", style: AppTextStyles.title,),
                Text("Conteúdo programático", style: AppTextStyles.heading,),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: AppTextStyles.body,
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                      });
                      print(_dropdownValue);
                    },
                    items: <String>[
                      "Chamada",
                      "9 - 10 Revisão NAC",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: AppTextStyles.body,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text("Informações complementares", style: AppTextStyles.heading,),
                TextField(
                  decoration:
                  InputDecoration(labelText: "Digite as informações complementares"),
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                  ],
                  controller: _infoController,
                  onEditingComplete: () {},
                ),

                OutlinedButton(
                  onPressed: () {
                    if (_qtAlunos == (_presentes + _ausentes)) {
                      print("Finalizar chamada");
                    } else {
                      print("Faltam alunos para serem chamados");
                    }
                  },
                  child: Text("Finalizar Chamada", style: AppTextStyles.button,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView buildListView(List<AlunoModel> alunos) {
    return ListView.builder(
      itemCount: alunos == null ? 0 : alunos.length,
      physics: ScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text("${alunos[index].rm}"),
            title: Text(alunos[index].nome),
            trailing: Text("${alunos[index].status}"),
            onTap: () {
              setState(() {
                _alunoSelecionado = alunos[index];
              });
            },
          ),
        );
      },
    );
  }
}
