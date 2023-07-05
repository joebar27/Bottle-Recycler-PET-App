import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/routes/app_routes.dart';
import 'package:bottlerecyclerapp/data/local_storage/secure_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Écoute de l'événement de fermeture de l'application
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    deleteSecureDataOnExit();
  });

  runApp(const MyApp());
}

void deleteSecureDataOnExit() async {
  print('effacement des données sécurisées');
  final secureStorage = SecureStorage();
  await secureStorage.deleteSecureData('userData');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottle Recycler App',
      initialRoute: AppRoutes.authScreen,
      routes: AppRoutes.routes,
    );
  }
}
