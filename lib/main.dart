// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/routes/app_routes.dart';
import 'package:bottlerecyclerapp/data/local_storage/secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      deleteSecureDataOnExit();
    }
  }

  void deleteSecureDataOnExit() async {
    print('effacement des données sécurisées');
    final secureStorage = SecureStorage();
    await secureStorage.deleteSecureData('userData');
  }

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
