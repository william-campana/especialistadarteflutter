
import 'dart:io';

void main() {
  bool encerrar   = false;
  String opcao    = "";
  String strOpcao = ''' 
     Escolha a Opção:
       1 - Listar Pacientes com mais de 20 anos
       2 - Quantidade de Pacientes com mais de 20 anos
       3 - Agrupamento de Pacientes por Familia
       4 - Sair
  ''';   

  var pacientes = [
  'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  while (!encerrar) {
    print(strOpcao);
    opcao = stdin.readLineSync();
    
    switch (opcao) {
      case '1':
         listarPacienteMaior20(pacientes);
         break;
      case '2':
         contarPacientesMaior20(pacientes);
         break;
      case '3':
         listarPorFamilia(pacientes);
         break;
      default:
         encerrar = true;
    }
  }
}

/** 
* @Autor: William Campana
* 
* @Descrição: Listar Pacientes com mais de 20 anos
*/
void listarPacienteMaior20(List<String> pacientes) {
  List<String> dadosPaciente = List();
  
  for (String paciente in pacientes) {
    dadosPaciente = paciente.split("|");
    
    if (int.tryParse(dadosPaciente[1]) > 20) {
      print("Nome: ${dadosPaciente[0]} - idade: ${dadosPaciente[1]}");
    }
  }

  print("Tecle ENTER para Continuar");
  stdin.readLineSync();
}

/** 
* @Autor: William Campana
* 
* @Descrição: Apresentar Quantidade de Pacientes com mais de 20 anos
*/
void contarPacientesMaior20(List<String> pacientes) {
  
  List<String> dadosPaciente = List();
  int contador               = 0;

  for (String paciente in pacientes) {
    dadosPaciente = paciente.split("|");

    if (int.tryParse(dadosPaciente[1]) > 20) {
      contador++;
    }
  }

  print('Quantidade de Pacientes com mais de 20 anos: $contador');
  print('Tecle ENTER para Continuar');
  stdin.readLineSync();
}

/** 
* @Autor: William Campana
* 
* @Descrição: Listar Pacientes por Familia
*/
void listarPorFamilia(List<String> pacientes) {
  List<String> pacienteTemp              = List();
  List<String> listaAddMapa              = List();
  Map<String, List<String>> listaFamilia = Map();
  
  String familia                         = "";
  String nomeCompleto                    = "";

  // loop na lista de pacientes para montar mapeamento da familia
  for (String paciente in pacientes) {
    pacienteTemp = paciente.substring(0, paciente.indexOf('|')).split(' ');
    listaAddMapa = List();
    familia      = pacienteTemp[1];
    nomeCompleto = pacienteTemp[0] + ' ' + pacienteTemp[1];

    // se existir a chave na lista então recuperar lista
    if (listaFamilia.containsKey(familia)) {
      listaAddMapa = listaFamilia[familia];
    }

    // adicionar item na lista e guardar na lista por chave
    listaAddMapa.add(nomeCompleto);
    listaFamilia[familia] = listaAddMapa;
  }

  // listar familias
  listaFamilia.forEach((key, value) {
    print('Familia: $key');

    value.sort();
    for (String nome in value) {
      print('   ' + nome);
    }

    print('\n');
  });
}