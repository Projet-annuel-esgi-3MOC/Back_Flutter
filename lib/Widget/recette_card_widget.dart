import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../WebServices/recette_service.dart';

class RecetteCard extends StatelessWidget {
  final Recette recette;
  static const double maxCardWidth = 350;
  static const double maxCardHeight = 400;

  const RecetteCard({required this.recette});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(
          '/details_recettes?recetteTitre=${recette.titre}',
        );
      },
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: maxCardWidth,
          maxHeight: maxCardHeight,
        ),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  recette.imageUrl,
                  fit: BoxFit.cover,
                  width: maxCardWidth,
                  height: maxCardHeight * 0.6,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recette.titre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      recette.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}