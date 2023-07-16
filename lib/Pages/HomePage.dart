import 'package:back_web_pa_flutter/Widget/agenda_widget.dart';
import 'package:back_web_pa_flutter/Widget/app_bar_widget.dart';
import 'package:back_web_pa_flutter/Widget/chart_widget.dart';
import 'package:back_web_pa_flutter/Widget/custom_card_home.dart';
import 'package:back_web_pa_flutter/Widget/side_menu_widget.dart';
import 'package:back_web_pa_flutter/Widget/user_list_widget.dart';
import 'package:flutter/material.dart';
import '../WebServices/data_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final DataService dataService = DataService();

  void handleSettingsPressed() {
    // Actions à effectuer lorsque l'utilisateur clique sur le bouton "Paramètres"
  }

  @override
  Widget build(BuildContext context) {
    // Récupérer les données pour le graphique depuis le service
    final chartData = dataService.getChartData();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Accueil',
        userName: 'John Doe',
        userProfileImageUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        onNotificationPressed: () {
        },
        onSettingsPressed: handleSettingsPressed,
        onProfilePressed: () {
        },
        onMenuPressed: () {
        },
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Row(
                          children: const [
                            Expanded(
                              child: CustomCardHome(icon: Icons.people, title: "Utilisateurs", content: "1000"),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: CustomCardHome(icon: Icons.restaurant_menu_outlined, title: "Recettes", content: "1000"),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: CustomCardHome(icon: Icons.leaderboard, title: "Compétitions", content: "5"),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: CustomCardHome(icon: Icons.support_agent_outlined, title: "Support", content: "1000"),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                        const Text("Statistiques "),
                        SizedBox(height: 20),
                        Expanded(
                          child: ChartWidget(
                            chartData: chartData,
                            animate: true,
                          ),
                        ),

                        SizedBox(height: 20),
                        const Text("Liste d'utilisateur"),
                        SizedBox(height: 20),
                        Expanded(
                          child: UserListWidget(),
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
