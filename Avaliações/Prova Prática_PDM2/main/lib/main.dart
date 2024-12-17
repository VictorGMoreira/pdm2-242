import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // URL da API REST Countries para pegar a lista de países
  var url = Uri.parse('https://restcountries.com/v3.1/all');

  // Realizando a requisição GET
  var response = await http.get(url);

  // Verificando se a requisição foi bem-sucedida
  if (response.statusCode == 200) {
    // Decodificando a resposta JSON
    List<dynamic> countries = json.decode(response.body);

    // Limite de países a serem exibidos
    int limit = 5;

    // Exibindo os países limitados e organizados
    for (int i = 0; i < limit && i < countries.length; i++) {
      var country = countries[i];
      print('País: ${country['name']['common']}');
      print('Capital: ${country['capital'] != null ? country['capital'][0] : 'N/A'}');
      print('Região: ${country['region']}');
      print('-' * 40);  // Linha separadora para melhorar a organização
    }
  } else {
    print('Falha ao carregar os dados. Código de status: ${response.statusCode}');
  }
}
