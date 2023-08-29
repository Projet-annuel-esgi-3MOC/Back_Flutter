import 'package:back_web_pa_flutter/Widget/user_card_messages.dart';
import 'package:flutter/material.dart';
import '../WebServices/user_service.dart';
import 'user_card.dart';

class UserListMessagesWidget extends StatefulWidget {
  @override
  _UserListMessagesWidgetState createState() => _UserListMessagesWidgetState();
}

class _UserListMessagesWidgetState extends State<UserListMessagesWidget> {
  late Future<List<User>> _userListFuture;

  @override
  void initState() {
    super.initState();
    _userListFuture = UserService.fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _userListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userList = snapshot.data!;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return UserCardMessages(user: user);
            },
          );
        } else {
          return Text('Aucune donnée');
        }
      },
    );
  }
}
