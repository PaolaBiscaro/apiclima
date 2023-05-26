//API Sincrona
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
      .then((response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        print("${i + 1}º ITEM");
        print("\tUsuario: ${data[i]['userId']}");
        print("\tCodigo: ${data[i]['id']}");
        print("\tTitulo: ${data[i]['title']}");
        print("\tCorpo: ${data[i]['body']}");
      }

      print("============================= OUTRO JEITO ============================");
      for (final item in data) {
        print("Codigo: ${item['id']}");
        print("Codigo: ${item['title']}");
        print("Codigo: ${item['body']}");
      }
      // print(data[1]['title']);
      // print(data[1]['body']);
    } else {
      print('Erro ao fazer requisição: ${response.statusCode}');
    }
  });
}


//API Assincrona
// import 'package:http/http.dart' as http;

// Future<void> main() async {
//   final url = Uri.parse('https://viacep.com.br/ws/17570000/json/');

//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     print(response.body);
//   }
// }

//Import DIO
// import 'package:dio/dio.dart';

// void main() async {
//   final dio = Dio();
//   final response = await dio.get('https://viacep.com.br/ws/17570000/json/');
//   print(response);
// }

// Future<void> main() async {
//   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//   final response = await http.get(url);
//   print(response.body);
// }
