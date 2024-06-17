import 'package:flutter/material.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/providers/character_provider.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/house_button.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/statistic_row.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    List<String> houses = ['Gryffindor', 'Slytherin', 'Ravenclaw', 'Hufflepuff', 'Not in House'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          TextButton(
            onPressed: characterProvider.resetGame,
            child: const Text('Reset', style: TextStyle(color: Colors.black)),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => characterProvider.loadRandomCharacter(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const StatisticsRow(),
              if (characterProvider.currentCharacter != null)
                Column(
                  children: [
                    Image.network(
                      characterProvider.currentCharacter!.image ?? "",
                      height: 100,
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          "No image",
                          style: TextStyle(fontSize: 24),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      characterProvider.currentCharacter!.name ?? "",
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return HouseButton(house: houses[index]);
                },
              ),
              HouseButton(house: houses.last),
            ],
          ),
        ),
      ),
    );
  }
}
