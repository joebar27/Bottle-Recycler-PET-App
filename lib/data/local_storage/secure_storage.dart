import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

// ? Lecture des données sécurisées:
  Future<String?> readSecureData(String key) async {
    String value = await storage.read(key: key) ?? '';
    print('Data read from secure_storage: $value');
    return value;
  }

// ? Ecriture des données sécurisées:
  Future<void> writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

// ? Suppression des données sécurisées:
  Future<void> deleteSecureData(String key) async {
    print('Data delete from Secure_storage: $key');
    await storage.delete(key: key);
  }
}
