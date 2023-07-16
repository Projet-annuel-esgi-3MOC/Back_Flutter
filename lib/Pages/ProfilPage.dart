import 'package:flutter/material.dart';

import '../Widget/agenda_widget.dart';
import '../Widget/app_bar_widget.dart';
import '../Widget/side_menu_widget.dart';


class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Accueil',
        userName: 'John Doe',
        userProfileImageUrl:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        onNotificationPressed: () {
        },
        onProfilePressed: () {
        },
        onMenuPressed: () {
        }, onSettingsPressed: () {  },
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
                  child: Container(
                    color: Colors.cyanAccent,
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

