import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/musica.dart';
import '../model/cantor.dart';

class ApiController {
  static const String baseUrl = 'http://localhost/api_musica_preparacao'; // ajuste conforme sua API

  static Future<List<Musica>> fetchMusicas() async {
    final response = await http.get(Uri.parse('$baseUrl/musica'));
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Musica.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar músicas');
    }
  }

  static Future<void> postMusica(Musica musica) async {
    final response = await http.post(
      Uri.parse('$baseUrl/musica'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(musica.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('✅ Música cadastrada com sucesso');
      print('Resposta: ${response.body}');
    } else {
      print('❌ Erro ao cadastrar música: ${response.statusCode}');
      print('Resposta: ${response.body}');
      throw Exception('Erro ao cadastrar música');
    }
  }


  static Future<List<Cantor>> fetchCantores() async {
    final response = await http.get(Uri.parse('$baseUrl/cantor'));
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Cantor.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar cantores');
    }
  }

  static Future<void> postCantor(Cantor cantor) async {
    final response = await http.post(
      Uri.parse('$baseUrl/cantor'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cantor.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('✅ Cantor cadastrado com sucesso');
      print('Resposta: ${response.body}');
    } else {
      print('❌ Erro ao cadastrar cantor: ${response.statusCode}');
      print('Resposta: ${response.body}');
      throw Exception('Erro ao cadastrar cantor');
    }
  }
}