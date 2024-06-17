import 'package:flutter/widgets.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/models/character.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/detail_row_widget.dart';

class CharacterDetailsWidget extends StatelessWidget {
  final Character character;

  const CharacterDetailsWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          character.image ?? "",
          height: 250,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              "No image",
              style: TextStyle(fontSize: 24),
            );
          },
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailRowWidget(label: 'House:', value: character.house),
            DetailRowWidget(label: 'Date of Birth:', value: character.yearOfBirth.toString()),
            DetailRowWidget(label: 'Actor:', value: character.actor),
            DetailRowWidget(label: 'Species:', value: character.species),
          ],
        ),
      ],
    );
  }
}
