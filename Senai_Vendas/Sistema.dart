import 'dart:io';
import 'Notas.dart';
import 'Alunos.dart';

var lista_alunos_cadastrados = <Alunos>[];
var lista_notas_cadastro = <Notas>[];
int? opcao;

void main(){


  while(opcao != 5) {
    try {
      menu();
      opcao = int.parse(stdin.readLineSync()!);
      switch (opcao) {
        case 1:
          addAluno();
          break;
        case 2:
          addNotas();
          break;
        case 3:
          exibirNotas();
          break;
        case 4:
          maiorNota();
          break;
        case 5:
          print("Programa encerrado!");
          break;
      }
    }catch(e){

    }
  }
}


void menu(){

  print("=====================================");
  print("MENU PRINCIPAL");
  print("1 - Cadastrar Alunos");
  print("2 - Cadastrar Notas");
  print("3 - Exibir Médias");
  print("4 - Aluno com Maior Média");
  print("5 - Sair");
  print("=====================================");


}

void addAluno(){

  var aluno_instancia = Alunos();
  print("Informe a matricula do aluno! (Ex.: 001, 002,...)");
  aluno_instancia.matricula = int.parse(stdin.readLineSync()!);
  print("Informe o nome do aluno a ser cadastrado!");
  aluno_instancia.nome = stdin.readLineSync();
  lista_alunos_cadastrados.add(aluno_instancia);
  exibirAluno();
}

void exibirAluno(){

  for(var i = 0; i < lista_alunos_cadastrados.length; i++){
    print("Matricula: ${lista_alunos_cadastrados[i].matricula}\n"
        "Nome: ${lista_alunos_cadastrados[i].nome}");

  }

}

void addNotas(){

  var notas_instancia = Notas();
  exibirAluno();
  print("Informe a matricula do aluno a cadastrar as notas!");
  notas_instancia.matricula = int.parse(stdin.readLineSync()!);
  print("Informe a nota da primeira avaliação!");
  notas_instancia.av1 = double.parse(stdin.readLineSync()!);
  print("Informe a nota da segunda avaliação!");
  notas_instancia.av2 = double.parse(stdin.readLineSync()!);
  print("Informe a nota da terceira avaliação!");
  notas_instancia.av3 = double.parse(stdin.readLineSync()!);
  notas_instancia.media = (notas_instancia.av1! + notas_instancia.av2! + notas_instancia.av3!)/3;
  lista_notas_cadastro.add(notas_instancia);
  exibirNotas();
}


void exibirNotas(){

  for(var i = 0; i < lista_alunos_cadastrados.length; i++){
    if(lista_notas_cadastro[i].media! > 6 && lista_notas_cadastro[i].media! < 7){
      print("Nome: ${lista_alunos_cadastrados[i].nome}\n"
          "Média real: ${lista_notas_cadastro[i].media!.toStringAsFixed(1)}");
      lista_notas_cadastro[i].media = 7;
      print("Média com aproximação: ${lista_notas_cadastro[i].media!.toStringAsFixed(1)}\n"
          "Situação: APROVADO POR APROXIMAÇÃO!");

    }
    else if(lista_notas_cadastro[i].media! <= 6){
      print("Nome: ${lista_alunos_cadastrados[i].nome}\n"
          "Média: ${lista_notas_cadastro[i].media!.toStringAsFixed(1)}\n"
          "Situação: REPROVADO!");
    }
    else if(lista_notas_cadastro[i].media! >= 7){
      print("Nome: ${lista_alunos_cadastrados[i].nome}\n"
          "Média: ${lista_notas_cadastro[i].media!.toStringAsFixed(1)}\n"
          "Situação: APROVADO!");
    }
  }
}


void maiorNota(){
  var maior_nota = lista_notas_cadastro[0].media;
  for(var i = 0; i < lista_notas_cadastro.length; i++) {
    if (lista_notas_cadastro[i].media! > maior_nota!) {
      maior_nota = lista_notas_cadastro[i].media;
    }
  }
  for(var i = 0; i < lista_notas_cadastro.length; i++){
    if (lista_notas_cadastro[i].media == maior_nota) {
      print("Nome: ${lista_alunos_cadastrados[i].nome}\n"
          "Média: ${maior_nota}");
    }
  }
}
