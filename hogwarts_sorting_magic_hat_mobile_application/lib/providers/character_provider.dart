import 'package:flutter/foundation.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/models/character.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/services/api_service.dart';

class CharacterProvider with ChangeNotifier {
  Character? _currentCharacter;
  int _totalGuesses = 0;
  int _correctGuesses = 0;
  int _wrongGuesses = 0;
  final List<Map<String, dynamic>> _guessedCharacters = [];
  List<Map<String, dynamic>> _searchedCharacters = [];

  Character? get currentCharacter => _currentCharacter;
  int get totalGuesses => _totalGuesses;
  int get correctGuesses => _correctGuesses;
  int get wrongGuesses => _wrongGuesses;
  List<Map<String, dynamic>> get guessedCharacters => _guessedCharacters;
  List<Map<String, dynamic>> get searchedCharacters => _searchedCharacters;

  CharacterProvider() {
    loadRandomCharacter();
    _searchedCharacters = _guessedCharacters;
  }

  Future<void> loadRandomCharacter() async {
    _currentCharacter = await ApiService().fetchRandomCharacter();
    notifyListeners();
  }

  void guessHouse(String house) {
    if (_currentCharacter == null) return;

    _totalGuesses++;

    String normalizedHouse = normalizeHouse(house);
    int existingIndex = findCharacterIndex();

    if (existingIndex != -1) {
      updateExistingCharacter(normalizedHouse, existingIndex);
    } else {
      addNewCharacter(normalizedHouse);
    }

    loadRandomCharacter();
    notifyListeners();
  }

  String normalizeHouse(String house) {
    return house == "Not in House" ? "" : house;
  }

  int findCharacterIndex() {
    return _guessedCharacters.indexWhere((element) => element['character'].id == _currentCharacter!.id);
  }

  void updateExistingCharacter(String normalizedHouse, int existingIndex) {
    bool isSuccessful = _currentCharacter!.house == normalizedHouse;

    if (!isSuccessful) {
      _guessedCharacters[existingIndex]['attempts']++;
    }

    _guessedCharacters[existingIndex]['successful'] = isSuccessful;

    if (isSuccessful) {
      _correctGuesses++;
    } else {
      _wrongGuesses++;
    }
  }

  void addNewCharacter(String normalizedHouse) {
    String actualHouse = _currentCharacter!.house ?? "Not in House";
    bool isSuccessful = actualHouse == normalizedHouse;

    if (isSuccessful) {
      _correctGuesses++;
    } else {
      _wrongGuesses++;
    }

    _guessedCharacters.add({
      'character': _currentCharacter!,
      'attempts': 1,
      'successful': isSuccessful,
    });
  }

  void reloadCharacter(Character character) {
    _currentCharacter = character;
    notifyListeners();
  }

  void resetGame() {
    _totalGuesses = 0;
    _correctGuesses = 0;
    _wrongGuesses = 0;
    _guessedCharacters.clear();
    searchCharacters("");
    notifyListeners();
  }

  void searchCharacters(String query) {
    if (query.isEmpty) {
      _searchedCharacters = _guessedCharacters;
    } else {
      _searchedCharacters = _guessedCharacters
          .where((element) => element['character'].name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
