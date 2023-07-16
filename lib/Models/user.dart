class User {
  final String id;
  final String name;
  final String surname;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
    );
  }
}
