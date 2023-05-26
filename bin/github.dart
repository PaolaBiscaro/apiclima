//pacote que usa para formatar codigos
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

Future<void> main() async {
  var url = Uri.parse('https://api.github.com/users/PaolaBiscaro');
  final headers = {
    'Authorization':
        'Bearer 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'
  };

  var response = await http.get(url, headers: headers);
  //print(response.body);
  var data = jsonDecode(response.body);

  /* 
  DateTime dataCriacao = DateTime.parse(data["created_at"]);
  DateTime dataAtualizacao = DateTime.parse(data["updated_at"]);
  intl.DateFormat formatoSaida = intl.DateFormat("dd/MM/yyyy HH:mm");
*/
  print("Nome: ${data["name"]}");
  //print("Data de Criação: ${formatoSaida.format(dataCriacao)}");
  print("Data de Criação: ${formataData(data["created_at"])}");
  //print("Ultimo Acesso: ${formatoSaida.format(dataAtualizacao)}");
  print("Ultimo Acesso: ${formataData(data["updated_at"])}");
  print("Endpoint Repositorio: ${data["repos_url"]}");

  url = Uri.parse(data["repos_url"]);
  response = await http.get(url, headers: headers);
  data = jsonDecode(response.body);

  print("PROJETOS:");
  for (final item in data) {
    print("\n==================== ${item['name']} =====================");
    print("ID do Projeto: ${item['id']}");
    print("URL: ${item['clone_url']}");
    print("Privado: ${item['private']}");
    print("Linguagens: ${item['language']}");
  }
}

String formataData(String data, {String formato = "dd/MM/yyyy HH:mm"}) {
  final dataConversao = DateTime.parse(data);
  final formatoSaida = intl.DateFormat(formato);
  return formatoSaida.format(dataConversao);
}
