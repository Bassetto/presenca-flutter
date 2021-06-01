import 'package:presenca/app/core/app_images.dart';
import 'package:presenca/app/model/aluno_model.dart';
import 'package:presenca/app/model/chamada_model.dart';

import 'database.dart';

class ChamadasRepository {
  Future<List<ChamadaModel>> findAll() async {
    var db = Database();
    await db.createDatabase();

    List<ChamadaModel> chamadas = [];

    if (db.created) {
      chamadas = [];
      chamadas.add(
        ChamadaModel(
          1,
          "3SIT",
          "Desenvolvimento Cross Plataform",
          "19:20",
          "21:00",
          "normal",
          30,
          28,
          2,
          DateTime.utc(2021, 5, 6),
          "Publicado",
          DateTime.utc(2021, 5, 6),
        ),
      );
      chamadas.add(
        ChamadaModel(
          2,
          "3SIR",
          "Desenvolvimento Cross Plataform",
          "21:20",
          "23:00",
          "normal",
          30,
          28,
          2,
          DateTime.utc(2021, 5, 6),
          "Publicado",
          DateTime.utc(2021, 5, 6),
        ),
      );
      chamadas.add(
        ChamadaModel(
          3,
          "3SIT",
          "Desenvolvimento Cross Plataform",
          "19:20",
          "21:00",
          "normal",
          30,
          28,
          2,
          DateTime.utc(2021, 5, 13),
          "Publicado",
          DateTime.utc(2021, 5, 17),
        ),
      );
      chamadas.add(
        ChamadaModel(
          4,
          "3SIR",
          "Desenvolvimento Cross Plataform",
          "21:20",
          "23:00",
          "normal",
          30,
          28,
          2,
          DateTime.utc(2021, 5, 13),
          "Publicado",
          DateTime.utc(2021, 5, 17),
        ),
      );
      chamadas.add(
        ChamadaModel(
          5,
          "3SIR",
          "Desenvolvimento Cross Plataform",
          "19:20",
          "21:00",
          "normal",
          30,
          28,
          2,
          DateTime.utc(2021, 5, 20),
          "Publicado",
          DateTime.utc(2021, 5, 21),
        ),
      );
      chamadas.add(
        ChamadaModel(
          6,
          "3SIT",
          "Desenvolvimento Cross Plataform",
          "21:20",
          "23:00",
          "normal",
          30,
          28,
          2,
          DateTime.utc(2021, 5, 20),
          "Publicado",
          DateTime.utc(2021, 5, 21),
        ),
      );
      chamadas.add(
        ChamadaModel(
          7,
          "3SIT",
          "Desenvolvimento Cross Plataform",
          "19:20",
          "21:00",
          "normal",
          30,
          null,
          null,
          DateTime.utc(2021, 6, 3),
          "Digitando",
          null,
        ),
      );
      chamadas.add(
        ChamadaModel(
          8,
          "3SIR",
          "Desenvolvimento Cross Plataform",
          "21:20",
          "23:00",
          "normal",
          30,
          null,
          null,
          DateTime.utc(2021, 6, 3),
          "Digitando",
          null,
        ),
      );
      chamadas.add(
        ChamadaModel(
          9,
          "3SIR",
          "Desenvolvimento Cross Plataform",
          "21:20",
          "23:00",
          "normal",
          30,
          null,
          null,
          DateTime.utc(2021, 6, 1),
          "Digitando",
          null,
        ),
      );
    }

    return new Future.value(chamadas);
  }

  Future<List<AlunoModel>> findAlunos() async {
    var db = Database();
    await db.createDatabase();

    List<AlunoModel> alunos = [];

    if (db.created) {
      alunos.add(AlunoModel(81988, "Andrey", ""));
      alunos.add(AlunoModel(82685, "David", ""));
      alunos.add(AlunoModel(83087, "Leonardo", ""));
      alunos.add(AlunoModel(81823, "Murillo", ""));
      alunos.add(AlunoModel(82422, "Victor", ""));
    }

    return Future.value(alunos);
  }

  Future<List<ChamadaModel>> findToday() async {
    var db = Database();
    await db.createDatabase();

    List<ChamadaModel> chamadas = [];

    if (db.created) {
      chamadas = [];
      chamadas.add(
        ChamadaModel(
          1,
          "3SIT",
          "Desenvolvimento Cross Plataform",
          "19:20",
          "21:00",
          "normal",
          30,
          null,
          null,
          DateTime.now(),
          "Digitando",
          DateTime.now(),
        ),
      );

      chamadas.add(
        ChamadaModel(
          2,
          "3SIR",
          "Desenvolvimento Cross Plataform",
          "21:20",
          "23:00",
          "normal",
          30,
          null,
          null,
          DateTime.now(),
          "Digitando",
          DateTime.now(),
        ),
      );
    }
    return new Future.value(chamadas);
  }
}
