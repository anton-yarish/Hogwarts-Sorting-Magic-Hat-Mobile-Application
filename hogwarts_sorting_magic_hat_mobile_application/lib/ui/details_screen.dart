import 'package:flutter/material.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/models/character.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/access_denied_widget.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/character_details_widget.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;
  final bool guessedCorrectly;

  const DetailsScreen({super.key, required this.character, required this.guessedCorrectly});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? ""),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: guessedCorrectly
            ? CharacterDetailsWidget(
                character: character,
              )
            : AccessDeniedWidget(
                imageUrl: character.image,
              ),
      ),
    );
  }
}
