import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presenca/app/core/app_text_styles.dart';

class ChamadaExtra extends StatefulWidget {
  const ChamadaExtra({Key key}) : super(key: key);

  @override
  _ChamadaExtraState createState() => _ChamadaExtraState();
}

class _ChamadaExtraState extends State<ChamadaExtra> {
  String _dropdownValue = "3SIR/Desenvolvimento Cross Plataform";
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 7)),
        lastDate: DateTime.now());
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Selecione uma turma e disciplina para fazer uma chamada extra",
                style: AppTextStyles.heading,
              ),
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
                    "3SIR/Desenvolvimento Cross Plataform",
                    "3SIT/Desenvolvimento Cross Plataform",
                    "3SIS/Desenvolvimento Cross Plataform"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: AppTextStyles.body,),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(DateFormat("'Data: ' dd/MM/yyyy").format(_selectedDate)),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      'Data da chamada',
                      style: AppTextStyles.button,
                    ),
                  ),
                ],
              ),
              Text(
                "Atenção só utilize essa opção para fazer chamada, caso não seja o dia da sua aula na turma",
                style: AppTextStyles.warning,
                softWrap: true,
              ),
              OutlinedButton(
                child: Text(
                  "Realizar chamada",
                  style: AppTextStyles.button,
                ),
                onPressed: () => print("Realizar chamada extra"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
