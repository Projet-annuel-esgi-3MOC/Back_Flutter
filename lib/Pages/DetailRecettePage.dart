import 'package:flutter/material.dart';
import '../Widget/agenda_widget.dart';
import '../Widget/app_bar_widget.dart';
import '../Widget/side_menu_widget.dart';

class DetailRecettePage extends StatelessWidget {
  final String recetteTitre;
  final String recetteImageUrl;
  final String recetteDescription;
  final List<String> recetteIngredients;

  const DetailRecettePage({
    required this.recetteTitre,
    required this.recetteImageUrl,
    required this.recetteDescription,
    required this.recetteIngredients,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Recettes',
        userName: 'John Doe',
        userProfileImageUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        onNotificationPressed: () {
          // Actions à effectuer lorsque l'utilisateur clique sur le bouton de notification
        },
        onProfilePressed: () {
          // Actions à effectuer lorsque l'utilisateur clique sur la photo de profil
        },
        onMenuPressed: () {
          // Actions à effectuer lorsque l'utilisateur clique sur le bouton de menu
        },
        onSettingsPressed: () {},
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            // Disposition en mode desktop
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SideMenu(),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Titre: $recetteTitre',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 16),
                        Image.network(
                          recetteImageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Description de la recette',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          recetteDescription,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Ingrédients',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recetteIngredients
                              .map((ingredient) => Text(
                            '- $ingredient',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ))
                              .toList(),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Action pour supprimer la recette
                              },
                              child: Text('Supprimer'),
                            ),
                            SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Action pour modifier la recette
                              },
                              child: Text('Modifier'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: CalendarScreen(),
                ),
              ],
            );
          } else {
            // Disposition en mode mobile
            return Column(
              children: [
                Expanded(
                  child: SideMenu(),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Titre: $recetteTitre',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 16),
                        Image.network(
                          recetteImageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Description de la recette',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          recetteDescription,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        const Text(
                          'Ingrédients',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recetteIngredients
                              .map((ingredient) => Text(
                            '- $ingredient',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ))
                              .toList(),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Action pour supprimer la recette
                              },
                              child: Text('Supprimer'),
                            ),
                            SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Action pour modifier la recette
                              },
                              child: Text('Modifier'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.cyanAccent,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
