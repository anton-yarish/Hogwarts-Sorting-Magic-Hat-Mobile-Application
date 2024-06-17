import 'package:flutter/material.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/providers/character_provider.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/stat_box.dart';
import 'package:provider/provider.dart';

class StatisticsRow extends StatelessWidget {
  const StatisticsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatBox(title: 'Total', value: characterProvider.totalGuesses),
        StatBox(title: 'Success', value: characterProvider.correctGuesses),
        StatBox(title: 'Failed', value: characterProvider.wrongGuesses),
      ],
    );
  }
}
