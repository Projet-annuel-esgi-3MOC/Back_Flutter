import 'dart:async';

class RecetteService {
  static Future<List<Recette>> fetchRecetteList() async {
    await Future.delayed(Duration(seconds: 2)); // Simule un délai de chargement

    List<Recette> recettes = [
      Recette(
        imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2960&q=80',
        titre: 'Recette 1',
        ingredients: ['Ingrédient 1', 'Ingrédient 2', 'Ingrédient 3'],
        description: 'Description de la recette 1',
        quantite: '2 portions',
        preparation: 'Préparation de la recette 1',
      ),
      Recette(
        imageUrl: 'https://plus.unsplash.com/premium_photo-1663036447682-8f0d918adbed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        titre: 'Recette 2',
        ingredients: ['Ingrédient A', 'Ingrédient B', 'Ingrédient C'],
        description: 'Description de la recette 2',
        quantite: '4 portions',
        preparation: 'Préparation de la recette 2',
      ),
      // Ajoutez d'autres recettes ici
    ];

    return recettes;
  }
}

class Recette {
  final String imageUrl;
  final String titre;
  final List<String> ingredients;
  final String description;
  final String quantite;
  final String preparation;

  Recette({
    required this.imageUrl,
    required this.titre,
    required this.ingredients,
    required this.description,
    required this.quantite,
    required this.preparation,
  });
}
