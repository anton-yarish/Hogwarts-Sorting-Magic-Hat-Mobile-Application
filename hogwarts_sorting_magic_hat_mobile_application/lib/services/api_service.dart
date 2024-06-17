// services/api_service.dart
import 'dart:convert';
import 'package:hogwarts_sorting_magic_hat_mobile_application/models/character.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://hp-api.onrender.com/api/characters';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<Character> fetchRandomCharacter() async {
    List<Character> characters = await fetchCharacters();
    if (characters.isEmpty) {
      throw Exception('No characters available');
    }
    characters.shuffle();
    return characters.first;
  }
}
