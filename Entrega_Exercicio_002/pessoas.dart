void main() {
  int qtMasculino      = 0;
  int qtFeminino       = 0;
  int qtPessoasMaior18 = 0;
  int idade            = 0;

  List<String> maisVelha = List();

  var pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino'
  ];

  Set<List<String>> listaSemDuplicados = Set();

  // 1) Leitura do Array de Pessoas, Remoção dos Duplicados e Impressão da Lista Original
  print('Lista Original');
  print('--------------');
  for (String pessoa in pessoas) {
    var dadosPessoa = pessoa.split('|');

    // Remoção dos duplicados
    if (!listaSemDuplicados.any((element) => element[0]+element[1] == dadosPessoa[0]+dadosPessoa[1])) {
       listaSemDuplicados.add(dadosPessoa);
      
       qtMasculino += (dadosPessoa[2] == 'Masculino' ? 1 : 0);
       qtFeminino  += (dadosPessoa[2] == 'Feminino'  ? 1 : 0);
    }

    print(dadosPessoa);
  }

  print('\n');
  print('Lista Sem Duplicados');
  print('--------------------');
  listaSemDuplicados.forEach((element) {
    print(element);
  });

  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  print('');
  print('Quantidade de Pessoas do sexo Masculino: $qtMasculino');
  print('Quantidade de Pessoas do sexo Feminimo:  $qtFeminino');


  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos 
  //     e mostre a quantidade de pessoas com mais de 18 anos
  print('\n');
  print('Filtrando pessoas Maiores de 18 anos');
  print('------------------------------------');
  
  var listaFiltradaMais18 = listaSemDuplicados.where((element) => int.parse(element[1]) > 18);

  qtMasculino = 0;
  qtFeminino  = 0;
 
  listaFiltradaMais18.forEach((pessoa) {
    print(pessoa);

    qtPessoasMaior18++;
    qtMasculino += pessoa[2] == 'Masculino' ? 1 : 0;
    qtFeminino  += pessoa[2] == 'Feminino'  ? 1 : 0;
  });

  print('');
  print('Quantidade de Pessoas Maiores de 18 anos: $qtPessoasMaior18');
  print('Quantidade de Pessoas do sexo Masculino Maior 18 anos: $qtMasculino');
  print('Quantidade de Pessoas do sexo Feminimo Maior 18 anos:  $qtFeminino');


  // 4 - Encontre a pessoa mais velha.
  print('\n');
  print('Pessoa mais Velha');
  print('-----------------');
  
  listaSemDuplicados.forEach((element) {
    if (int.parse(element[1]) > idade) {
      maisVelha = element;
      idade = int.parse(element[1]);
    }
  });

  print('A pessoa mais velha é: ${maisVelha[0]} com: ${maisVelha[1]} anos e é do sexo: ${maisVelha[2]}');

}