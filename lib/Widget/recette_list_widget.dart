import 'package:flutter/material.dart';
import '../WebServices/recette_service.dart';
import 'recette_card_widget.dart';

class RecetteListWidget extends StatefulWidget {
  @override
  _RecetteListWidgetState createState() => _RecetteListWidgetState();
}

class _RecetteListWidgetState extends State<RecetteListWidget> {
  late Future<List<Recette>> _recetteListFuture;

  @override
  void initState() {
    super.initState();
    _recetteListFuture = RecetteService.fetchRecetteList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recette>>(
      future: _recetteListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        } else if (snapshot.hasData) {
          final recetteList = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recetteList.map((recette) => RecetteCard(recette: recette)).toList(),
            ),
          );
        } else {
          return Text('Aucune donnée');
        }
      },
    );
  }
}
