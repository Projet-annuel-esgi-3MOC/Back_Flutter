import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Constants/api_constants.dart';
import '../Models/user.dart';

class AuthService {

  Future<String?> registerUser(String name, String surname, String email,
      String password) async {
    final url = Uri.parse('${APIConstants.apiUrl}/users/register');
    print('Request URL: $url');
    final body = {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'role': 'admin'
      
    };

    final response = await http.post(
        Uri.parse(url.toString()), body: json.encode(body),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final message = data['message'];
      print(response.body);
      return message;
    } else {
      print(response.body);
      throw Exception('Failed to register user' + response.toString());
    }
  }

  Future<String?> loginUser(String email, String password) async {
    final url = Uri.parse('${APIConstants.apiUrl}/users/login');

    final body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
        Uri.parse(url.toString()), body: json.encode(body),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      return token;
    } else {
      throw Exception('Failed to login user');
    }
  }

  Future<String?> logout(String email, String password) async {
    final url = Uri.parse('${APIConstants.apiUrl}/users/logout');

    final body = {
      'email': email,
      'password': password,
    };

    final response = await http.post(
        Uri.parse(url.toString()), body: json.encode(body),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      return token;
    } else {
      throw Exception('Failed to login user');
    }
  }
}
