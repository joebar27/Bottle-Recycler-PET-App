import 'dart:convert';
import 'dart:io'; // Import this for SocketException

import 'package:http/http.dart' as http;
import 'package:bottlerecyclerapp/constants/utils.dart';

Future<Map<String, dynamic>> userLogin(String email, String password) async {
  String url = Utils.baseUrl + "users/"+ email;
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

Future<Map<String, dynamic>> userRegister(String email, String password) async {
  String url = Utils.baseUrl + "users/"+ email;
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
