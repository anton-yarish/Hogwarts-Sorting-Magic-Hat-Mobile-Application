import 'package:flutter/material.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/providers/bottom_nav_provider.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/providers/character_provider.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/details_screen.dart';
import 'package:hogwarts_sorting_magic_hat_mobile_application/ui/widgets/statistic_row.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final characterProvider = Provider.of<CharacterProvider>(context);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
        actions: [
          TextButton(
            onPressed: characterProvider.resetGame,
            child: const Text('Reset', style: TextStyle(color: Colors.black)),
          )
        ],
      ),
      body: Column(
        children: [
          const StatisticsRow(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Filter characters...',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                characterProvider.searchCharacters(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<CharacterProvider>(
              builder: (context, characterProvider, _) {
                List<Map<String, dynamic>> filteredCharacters = characterProvider.searchedCharacters;
                return ListView.builder(
                  itemCount: filteredCharacters.length,
                  itemBuilder: (context, index) {
                    final guessed = filteredCharacters[index];
                    final character = guessed['character'];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              character: character,
                              guessedCorrectly: guessed['successful'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.white54,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(
                                character.image!,
                                width: 40,
                                height: 50,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(
                                    "No image",
                                    style: TextStyle(fontSize: 9),
                                  );
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(character.name!),
                                  Text('Attempts: ${guessed['attempts']}'),
                                ],
                              ),
                              const Spacer(),
                              guessed['successful']
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : Row(
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              bottomNavProvider.selectIndex(0);
                                              characterProvider.reloadCharacter(character);
                                            },
                                            child: const Icon(Icons.replay_outlined)),
                                        const Icon(Icons.close, color: Colors.red),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
