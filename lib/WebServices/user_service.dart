import 'dart:async';

class UserService {
  static Future<List<User>> fetchUserList() async {
    await Future.delayed(Duration(seconds: 2)); // Simule un délai de chargement

    List<User> users = [
      User(
        photoUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        name: 'John Doe',
        league: 'Ligue 1',
        level: 'Niveau 5',
        creationDate: DateTime(2022, 10, 15),
      ),
      User(
        photoUrl: 'https://images.unsplash.com/photo-1525357816819-392d2380d821?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1674&q=80',
        name: 'Jane Smith',
        league: 'Ligue 2',
        level: 'Niveau 3',
        creationDate: DateTime(2022, 11, 20),
      ),

      User(
        photoUrl: 'https://images.unsplash.com/photo-1584598788860-2695a3a6c874?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=794&q=80',
        name: 'Jane Smith',
        league: 'Ligue 2',
        level: 'Niveau 3',
        creationDate: DateTime(2022, 11, 20),
      ),

      User(
        photoUrl: 'https://plus.unsplash.com/premium_photo-1666265384842-31bdda25f026?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        name: 'Jane Smith',
        league: 'Ligue 2',
        level: 'Niveau 3',
        creationDate: DateTime(2022, 11, 20),
      ),

      User(
        photoUrl: 'https://images.unsplash.com/photo-1446511437394-36cdff3ae1b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        name: 'Jane Smith',
        league: 'Ligue 2',
        level: 'Niveau 3',
        creationDate: DateTime(2022, 11, 20),
      ),

      User(
        photoUrl: 'https://images.unsplash.com/photo-1461039088886-b5c863279a0e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80',
        name: 'Jane Smith',
        league: 'Ligue 2',
        level: 'Niveau 3',
        creationDate: DateTime(2022, 11, 20),
      ),
     ];

    return users;
  }
}

class User {
  final String photoUrl;
  final String name;
  final String league;
  final String level;
  final DateTime creationDate;

  User({
    required this.photoUrl,
    required this.name,
    required this.league,
    required this.level,
    required this.creationDate,
  });
}
