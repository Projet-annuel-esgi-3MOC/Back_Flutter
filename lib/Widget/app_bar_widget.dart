import 'package:back_web_pa_flutter/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String userName;
  final String userProfileImageUrl;
  final VoidCallback onNotificationPressed;
  final VoidCallback onSettingsPressed;
  final VoidCallback onProfilePressed;
  final VoidCallback onMenuPressed;

  const CustomAppBar({
    required this.title,
    required this.userName,
    required this.userProfileImageUrl,
    required this.onNotificationPressed,
    required this.onSettingsPressed,
    required this.onProfilePressed,
    required this.onMenuPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _showProfileOptions = false;

  void _toggleProfileOptions() {
    setState(() {
      _showProfileOptions = !_showProfileOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;
    final isMobile = !isDesktop;

    return AppBar(
      backgroundColor: grayApp,
      leading: isMobile
          ? IconButton(
        icon: const Icon(Icons.menu),
        onPressed: widget.onMenuPressed,
      )
          : null,
      title: Row(
        children: [
          if (isDesktop) ...[
            Image.asset(
              "assets/images/logo.png",
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 10),
          ],
          Text(
            'Hello ${widget.userName}',
            style: const TextStyle(color: Colors.black),
          ),
          if (isDesktop) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 30,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Rechercher',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: greenApp,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: widget.onNotificationPressed,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: greenApp,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: widget.onSettingsPressed,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
          ],
          if (isDesktop) ...[
            GestureDetector(
              onTap: _toggleProfileOptions,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  widget.userProfileImageUrl,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.account_circle);
                  },
                ),
              ),
            ),
          ],
        ],
      ),
      actions: [
        if (_showProfileOptions)
          PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'logout',
                child: const Text('Se déconnecter'),
              ),
              PopupMenuItem<String>(
                value: 'editProfile',
                child: const Text('Modifier le profil'),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                // Action pour se déconnecter
              } else if (value == 'editProfile') {
                // Action pour modifier le profil
              }
              _toggleProfileOptions();
            },
          ),
      ],
    );
  }
}
