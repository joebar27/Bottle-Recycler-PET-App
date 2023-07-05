import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bottlerecyclerapp/core/utils/utils.dart';

Future<Map<String, dynamic>> sendRequest(
    String url, Map<String, String> headers,
    {String? body}) async {
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    // Mot de passe correct
    return {'status': 'success', 'data': response.body};
  } else if (response.statusCode == 401 || response.statusCode == 404) {
    return {'status': 'error', 'message': 'Email ou mot de passe incorrect'};
  } else {
    return {'status': 'error', 'message': 'Erreur lors de la requête'};
  }
}

Future<Map<String, dynamic>> userData(String email) async {
  String url = Utils.baseUrl + "users/" + email;
  return sendRequest(url, {'Content-Type': 'application/json'});
}

Future<Map<String, dynamic>> userRegister(String name, String username,
    String email, String password, String phone) async {
  String url = Utils.baseUrl + "users/register";
  final body = jsonEncode({
    "name": name,
    "username": username,
    "email": email,
    "password": password,
    "phone": phone
  });
  return sendRequest(url, {'Content-Type': 'application/json', 'Accept': 'application/json'}, body: body);
}


Future<Map<String, dynamic>> userLogin(String email, String password) async {
  final url = Utils.baseUrl + "users/login";

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    // Mot de passe correct
    return {'status': 'success', 'data': response.body};
  } else if (response.statusCode == 401 || response.statusCode == 404) {
    return {'status': 'error', 'message': 'Email ou mot de passe incorrect'};
  } else {
    return {'status': 'error', 'message': 'Erreur lors de la requête'};
  }
}
