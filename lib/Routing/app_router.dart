import 'package:back_web_pa_flutter/Pages/DetailRecettePage.dart';
import 'package:back_web_pa_flutter/Pages/DetailUtilisateurPage.dart';
import 'package:back_web_pa_flutter/Pages/ForgotPasswordPage.dart';
import 'package:back_web_pa_flutter/Pages/HomePage.dart';
import 'package:back_web_pa_flutter/Pages/ProfilPage.dart';
import 'package:back_web_pa_flutter/Pages/RecettesPage.dart';
import 'package:back_web_pa_flutter/Pages/RegisterPage.dart';
import 'package:back_web_pa_flutter/Pages/SupportsPage.dart';
import 'package:back_web_pa_flutter/Pages/UtilisateursPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:back_web_pa_flutter/Pages/ConnexionPage.dart';



class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(child: HomePage())
      ),
      GoRoute(
        path: '/connexion',
        pageBuilder: (context, state) => MaterialPage(child: ConnexionPage()),
      ),
      GoRoute(
        path: '/details_recettes',
        pageBuilder: (context, state) {
          final recetteTitre = state.queryParams['recetteTitre'] as String?;
          final recetteImageUrl = ''; // Ajoutez le code pour récupérer l'URL de l'image de la recette
          final recetteDescription = ''; // Ajoutez le code pour récupérer la description de la recette
          final recetteIngredients = <String>[]; // Ajoutez le code pour récupérer la liste des ingrédients de la recette

          return MaterialPage(
            child: recetteTitre != null
                ? DetailRecettePage(
              recetteTitre: recetteTitre,
              recetteImageUrl: recetteImageUrl,
              recetteDescription: recetteDescription,
              recetteIngredients: recetteIngredients,
            )
                : SizedBox.shrink(),
          );
        },
      ),


      GoRoute(
        path: '/details_utilisateur',
        pageBuilder: (context, state) {
          final userName = state.queryParams['userName'] as String?;
          return userName != null
              ? MaterialPage(child: DetailUtilisateurPage(userName: userName))
              : MaterialPage(child: SizedBox.shrink());
        },
      ),

      GoRoute(
        path: '/utilisateurs',
        pageBuilder: (context, state) => MaterialPage(child: UtilisateursPage()),
      ),
      GoRoute(
        path: '/recettes',
        pageBuilder: (context, state) => MaterialPage(child: RecettesPage()),
      ),
      GoRoute(
        path: '/support',
        pageBuilder: (context, state) => MaterialPage(child: SupportsPage()),
      ),
      GoRoute(
        path: '/profil',
        pageBuilder: (context, state) => MaterialPage(child: ProfilPage()),
      ),

      GoRoute(
        path: '/reinitialisation',
        pageBuilder: (context, state) => MaterialPage(child: ForgotPasswordPage()),
      ),

      GoRoute(
        path: '/inscription',
        pageBuilder: (context, state) => MaterialPage(child: RegisterPage()),
      ),
    ],
  );
}
