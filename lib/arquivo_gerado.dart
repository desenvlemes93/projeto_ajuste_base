import 'dart:io';

class ArquivoGerado {
  ArquivoGerado._();

  static void ajusteBase() {
    String conteudo = File('assets/item007.txt').readAsStringSync();
    RegExp regExp = RegExp(
      r'(CFe)[0-9]{0,44}',
    );
    var numeroNota = '';
    var numeroSerie = '';
    final numCaixa = 1;
    final dtArquivo = '04-JUL-2022';
    final encontrados =
        (regExp.allMatches(conteudo).map((e) => e.group(0)).toList());
    for (var nota in encontrados) {
      if (nota != null) {
        numeroNota = nota.substring(34, 40);
        numeroSerie = nota.substring(3, 47);
        print(
            '''INSERT INTO PCCORRECAOCAIXA(NUMCAIXA, NUMNOTA, NUMEROSERIE,CHAVE, DATA) VALUES(${numCaixa}, ${numeroNota}, ${numeroSerie}, ${nota}, ${dtArquivo} );''');
      }
    }
  }
}
