import 'package:bottlerecyclerapp/screens/Auth.dart';
import 'package:bottlerecyclerapp/screens/Register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottle Recycler App',
      // home: AuthScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
