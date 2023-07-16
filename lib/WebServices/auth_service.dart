import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Constants/api_constants.dart';
import '../Models/user.dart';

class AuthService {
  Future<String?> registerUser(String name, String surname, String email, String password) async {
    const url = '${APIConstants.apiUrl}users/register';
    final body = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    };

    final response = await http.post(Uri.parse(url), body: json.encode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final message = data['message'];
      print(response.body);
      return message;
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<String?> loginUser(String email, String password) async {
    const url = '${APIConstants.apiUrl}users/login';
    final body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(Uri.parse(url), body: json.encode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      return token;
    } else {
      throw Exception('Failed to login user');
    }
  }

  Future<void> logoutUser(String token) async {
    const url = '${APIConstants.apiUrl}users/logout';

    final response = await http.post(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to logout user');
    }
  }

  Future<List<User>> getUsers(String token) async {
    const url = '${APIConstants.apiUrl}users';

    final response = await http.get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final users = data.map((userData) => User.fromJson(userData)).toList();
      return users;
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
