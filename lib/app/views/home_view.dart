import 'package:flutter/material.dart';
import 'package:presenca/app/components/app_bar_widget.dart';
import 'package:presenca/app/components/chamadas_hoje_list_widget.dart';
import 'package:presenca/app/components/chamadas_list_widget.dart';
import 'package:presenca/app/core/app_colors.dart';
import 'package:presenca/app/core/app_text_styles.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final String nome = "Victor Bassetto";
    final double phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.rosaFiap,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Professor(a)\n$nome",
                    style: AppTextStyles.title,
                    softWrap: true,
                  ),
                  Text(
                    "Sua seção expira as 22:13",
                    style: AppTextStyles.body,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                    ),
                    child: Text(
                      "Sair",
                      style: AppTextStyles.body,
                    ),
                    onPressed: () => print("Apertou"),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Alunos",
                style: AppTextStyles.options,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("alunos");
              },
            ),
            ListTile(
              title: Text(
                "Professores",
                style: AppTextStyles.options,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("professores");
              },
            ),
            ListTile(
              title: Text(
                "Gerencial",
                style: AppTextStyles.options,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("gerencial");
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Turmas que você ministrará aula hoje:",
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: phoneHeight * 0.25,
            child: ChamadasHojeListWidget(),
          ),
          SafeArea(
            child: OutlinedButton(
              child: Text("Realizar chamada extra", style: AppTextStyles.button,),
              onPressed: () => Navigator.of(context).pushNamed("chamadaExtra"),
            ),
          ),
          Text(
            "Lista de chamadas já feitas:",
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: phoneHeight * 0.4,
            child: ChamadasListWidget(),
          ),
        ],
      ),
    );
  }
}
