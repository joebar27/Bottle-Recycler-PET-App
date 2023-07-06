import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bottlerecyclerapp/core/utils/utils.dart';


Future<Map<String, dynamic>> sendRequest(
    String url, Map<String, String> headers, String method,
    {String? body}) async {
  http.Response response;

  if (method == 'GET') {
    response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
  } else if (method == 'POST') {
    response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  } else if (method == 'DELETE'){
    response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
  }else {
    throw Exception('Method not supported');
  }
  if (response.statusCode == 200) {
    return {'status': 'success', 'data': response.body};
  } else if (response.statusCode == 201) {
    return {'status': 'success', 'message': 'created successfully', 'data': response.body};
  } else if (response.statusCode == 401) {
    return {'status': 'error', 'message': 'access denied'};
  } else if (response.statusCode == 404) {
    return {'status': 'error', 'message': 'data not found'};
  } else {
    return {'status': 'error', 'message': 'Erreur lors de la requête'};
  }
}

Future<Map<String, dynamic>> userData(String email) async {
  String url = Utils.baseUrl + "users/" + email;
  return sendRequest(url, {'Content-Type': 'application/json'}, 'GET');
}

Future<Map<String, dynamic>> userRegister(String name, String username,
    String email, String password, String phone) async {
  final url = Utils.baseUrl + "users/register";
  return sendRequest(
      url,
      {'Content-Type': 'application/json'},
      body: json.encode({
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone
      }),
      'POST');
  }

Future<Map<String, dynamic>> userLogin(String email, String password) async {
  final url = Utils.baseUrl + "users/login";

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    return {'status': 'success', 'data': response.body};
  } else if (response.statusCode == 401) {
    return {'status': 'error', 'message': 'access denied'};
  } else if (response.statusCode == 404) {
    return {'status': 'error', 'message': 'data not found'};
  } else {
    return {'status': 'error', 'message': 'Erreur lors de la requête'};
  }
}

Future<Map<String, dynamic>> userDestroy(String email) async {
  String url = Utils.baseUrl + "users/" + email;
  return sendRequest(url, {'Content-Type': 'application/json'}, 'DELETE');
}