import 'dart:convert';
import 'dart:io'; // Import this for SocketException

import 'package:flutter/services.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
// import 'package:dbcrypt/dbcrypt.dart';

import 'package:http/http.dart' as http;
import 'package:bottlerecyclerapp/core/utils/utils.dart';

Future<Map<String, dynamic>> userData(String email) async {
  String url = Utils.baseUrl + "users/" + email;
  print('URL for request: $url');
  try {
    final response = await http.get(
      Uri.parse(url),
      // body: jsonEncode({"username": username}),
      // headers: {
      //   "Content-Type": "application/json",
      // },
    );

    if (response.statusCode == 200) {
      var convertDataToJson = jsonDecode(response.body);

      if (convertDataToJson is Map<String, dynamic>) {
        print('convertdatajson: $convertDataToJson');
        return convertDataToJson;
      } else {
        throw Exception('Invalid format received from the server');
      }
    } else if (response.statusCode == 400) {
      // Bad Request - Invalid credentials
      var errorJson = jsonDecode(response.body);
      var errorMessage = errorJson['message'];
      throw Exception(errorMessage);
    } else if (response.statusCode == 404) {
      // Not Found - User not found
      throw Exception('Utilisateur introuvable: ${response.statusCode}}');
    } else {
      throw Exception(
          'Server responded with status code: ${response.statusCode}');
    }
  } on SocketException catch (_) {
    return {'error': 'Connexion refusée'};
  } catch (e) {
    print('Error occurred: $e');
    return {'error': 'Une erreur inattendue est survenue'};
  }
}

Future<Map<String, dynamic>> userRegister(String name, String username,
    String email, String password, String phone) async {
  String url = Utils.baseUrl + "users/register";
  print('URL for request: $url');
  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var convertDataToJson = jsonDecode(response.body);

      if (convertDataToJson is Map<String, dynamic>) {
        print(convertDataToJson);
        return convertDataToJson;
      } else {
        throw Exception('Invalid format received from the server');
      }
    } else if (response.statusCode == 400) {
      // Bad Request - Invalid credentials
      var errorJson = jsonDecode(response.body);
      var errorMessage = errorJson['message'];
      throw Exception(errorMessage);
    } else if (response.statusCode == 404) {
      // Not Found - User not found
      throw Exception('Utilisateur introuvable');
    } else {
      throw Exception(
          'Server responded with status code: ${response.statusCode}');
    }
  } on SocketException catch (_) {
    return {'error': 'Connexion refusée'};
  } catch (e) {
    print('Error occurred: $e');
    return {'error': 'Une erreur inattendue est survenue'};
  }
}

Future<String> userLogin(String email, String password) async {
  final url = Utils.baseUrl + "users/login";

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    // Mot de passe correct
    // print('response.body: ' + response.body);
    return response.body;
  } else if (response.statusCode == 401) {
    return 'Mot de passe incorrect';
  } else if (response.statusCode == 404) {
    return 'Utilisateur non trouvé';
  } else {
    return 'Erreur lors de la requête';
  }
}
