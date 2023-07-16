import 'package:flutter/material.dart';
import '../Widget/app_bar_widget.dart';
import '../Widget/side_menu_widget.dart';

class DetailUtilisateurPage extends StatelessWidget {
  final String userName;

  const DetailUtilisateurPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Détails de l\'utilisateur',
        onProfilePressed: () {
          // Actions à effectuer lorsque l'utilisateur clique sur la photo de profil
        },
        onMenuPressed: () {
          // Actions à effectuer lorsque l'utilisateur clique sur le bouton de menu
        },
        onSettingsPressed: () {
          // Actions à effectuer lorsque l'utilisateur clique sur le bouton "Paramètres"
        },
        userName: userName,
        userProfileImageUrl: '',
        onNotificationPressed: () {},
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 600) {
            // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ //
            // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  Disposition en mode desktop $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ //
            // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ //
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
                        Text('Nom: $userName'),
                        // Autres détails de l'utilisateur
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ //
            // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  Disposition en mode mobil $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ //
            // $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ //
            return Column(
              children: [
                Expanded(
                  child: SideMenu(),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.pink,
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
