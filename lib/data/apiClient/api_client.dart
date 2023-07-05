import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:bottlerecyclerapp/core/utils/utils.dart';

Future<Map<String, dynamic>> userData(String email) async {
  String url = Utils.baseUrl + "users/" + email;
  print('URL for request: $url');
  try {
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      print('response.body2: ' + response.body);
      var convertDataToJson = jsonDecode(response.body);

        print('convertdatajson: $convertDataToJson');
      if (convertDataToJson is Map<String, dynamic>) {
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
    // print('Error occurred: $e');
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
  final passwordHashed = hashPassword(password);

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'email': email, 'password': passwordHashed}),
  );

  if (response.statusCode == 200) {
    return response.body;
  } else if (response.statusCode == 401) {
    return 'Mot de passe incorrect';
  } else if (response.statusCode == 404) {
    return 'Utilisateur non trouvé';
  } else {
    return 'Erreur lors de la requête';
  }
}

String hashPassword(String password) {
    // Convertir le mot de passe en bytes
    var bytes = utf8.encode(password);
    // Calculer le hachage SHA-256
    var digest = sha256.convert(bytes);
    // Retourner le hachage sous forme de chaîne hexadécimale
    return digest.toString();
  }
