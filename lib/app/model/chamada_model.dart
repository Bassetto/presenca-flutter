class ChamadaModel {
  int id;
  String turma;
  String disciplina;
  String horarioInicio;
  String horarioTermino;
  String tipo;
  int qtdAlunos;
  int qtdPresentes;
  int qtdAusentes;
  String status;
  DateTime data;
  DateTime dataFinalizado;

  ChamadaModel(this.id, this.turma, this.disciplina, this.horarioInicio, this.horarioTermino, this.tipo, this.qtdAlunos, this.qtdPresentes, this.qtdAusentes, this.data, this.status,
      this.dataFinalizado);
}