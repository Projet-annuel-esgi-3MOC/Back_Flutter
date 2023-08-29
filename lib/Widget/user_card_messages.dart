import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../WebServices/user_service.dart';

class UserCardMessages extends StatelessWidget {
  final User user;

  const UserCardMessages({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          GoRouter.of(context).go(
            '/details_utilisateur?userName=${user.name}',
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.photoUrl),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Expanded(child: Text(user.name)),
            SizedBox(width: 20),
            Expanded(child: Text(user.league)),
            SizedBox(width: 20),
            Expanded(child: Text(user.level)),
            SizedBox(width: 20),
            Expanded(child: Text(user.creationDate.toString())),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
