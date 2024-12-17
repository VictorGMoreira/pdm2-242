import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  
  try {
    // Realizando a requisição GET
    var response = await http.get(url);

    // Verificando se a requisição foi bem-sucedida
    if (response.statusCode == 200) {
      // Decodificando a resposta JSON
      var data = json.decode(response.body);

      // Exibindo os títulos dos primeiros 5 posts
      print('Primeiros 5 posts:');
      for (var i = 0; i < 5; i++) {
        print('Post ${i + 1}: ${data[i]['title']}');
      }
    } else {
      print('Falha ao carregar os dados. Código de status: ${response.statusCode}');
    }
  } catch (e) {
    // Tratando qualquer erro de conexão ou requisição
    print('Erro ao fazer requisição: $e');
  }
}
