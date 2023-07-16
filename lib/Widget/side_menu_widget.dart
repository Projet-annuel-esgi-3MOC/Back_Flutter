import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _selectedIndex = 0;

  void _onMenuItemClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });

    GoRouter.of(context).go('/${_getRouteName(index)}');
  }

  String _getRouteName(int index) {
    switch (index) {
      case 0:
        return '';
      case 1:
        return 'utilisateurs';
      case 2:
        return 'recettes';
      case 3:
        return 'support';
      default:
        return '';
    }
  }

  Widget _buildMenuItem(int index, IconData icon) {
    final isSelected = index == _selectedIndex;
    final color = isSelected ? Colors.green : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child : ListTile(
        onTap: () => _onMenuItemClicked(index),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            if (isSelected) CircleAvatar(
              radius: 2,
              backgroundColor: color,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _buildMenuItem(0, Icons.home),
          _buildMenuItem(1, Icons.person),
          _buildMenuItem(2, Icons.restaurant),
          _buildMenuItem(3, Icons.message,),
        ],
      ),
    );
  }
}
