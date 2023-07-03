import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/routes/app_routes.dart';

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
      initialRoute: AppRoutes.authScreen,
      routes: AppRoutes.routes,
    );
  }
} 
