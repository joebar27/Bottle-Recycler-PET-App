import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/screens/Auth.dart';
import 'package:bottlerecyclerapp/screens/Register.dart';
import 'package:bottlerecyclerapp/screens/Home.dart';
import 'package:bottlerecyclerapp/screens/TutoDebutant.dart';
import 'package:bottlerecyclerapp/screens/ProfilUser.dart';
import 'package:bottlerecyclerapp/screens/ChangePassword.dart';

class AppRoutes {
  static const String authScreen = '/Auth';
  static const String registerScreen = '/Register';
  static const String homeScreen = '/Home';
  static const String tutoDebutantScreen = '/TutoDebutant';
  static const String profilUserScreen = '/ProfilUser';
  static const String changePasswordScreen = '/ChangePassword';

  static Map<String, WidgetBuilder> routes = {
    authScreen: (context) => AuthScreen(),
    registerScreen: (context) => RegisterScreen(),
    homeScreen: (context) => HomeScreen(),
    tutoDebutantScreen: (context) => TutoDebutantScreen(),
    profilUserScreen: (context) => ProfilUserScreen(),
    changePasswordScreen: (context) => ChangePasswordScreen(),
  };
}
