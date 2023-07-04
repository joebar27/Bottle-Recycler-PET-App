// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_is_not_empty, depend_on_referenced_packages
import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:bottlerecyclerapp/data/local_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/components/CustomButton.dart';
import 'package:bottlerecyclerapp/data/apiClient/api_client.dart' as api;
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  // final storage = FlutterSecureStorage();

  final RegExp _emailRegExp =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  bool _isSecret = true;
  String data = '';

@override
  void initState() {
    super.initState();
    userIsConnect();
  }

  void userIsConnect() async {
    var secureStorage = SecureStorage();
    var userData = await secureStorage.readSecureData('userData');
    if (userData != null) {
      Navigator.pushNamed(context, AppRoutes.profilUserScreen);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundApp,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30.0),
            const Text(
              'Bienvenue sur\n',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Bottle Recycler App',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            CustomImageView(
              imagePath: ImageConstant.imgImage1,
              height: getSize(
                MediaQuery.of(context).size.height * 0.25,
              ),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Connectez-vous pour continuer',
              style: TextStyle(
                color: Color.fromARGB(255, 46, 176, 199),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //! champs email :
                  TextFormField(
                    controller: _emailController,
                    // onChanged: (value) => setState(() => _email = value),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !_emailRegExp.hasMatch(value)) {
                        return 'Veuillez saisir votre adresse email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      // labelText: _labelText,
                      filled: true,
                      fillColor: Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  //! champs mot de passe :
                  TextFormField(
                    controller: _mdpController,
                    // onChanged: (value) => setState(() => _mdp = value),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Veuillez saisir un mot de passe\nde 6 caractères au moins';
                      }
                      return null;
                    },
                    obscureText: _isSecret,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      suffixIcon: InkWell(
                        onTap: () => setState(() => _isSecret = !_isSecret),
                        child: Icon(
                          !_isSecret ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      // labelText: _labelText,
                      filled: true,
                      fillColor: Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  //! bouton connexion :
                  CustomButton.primary(
                    text: 'Se connecter',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var email = _emailController.text;
                        var password = hashPassword(_mdpController.text);

                        if (!email.isEmpty && !password.isEmpty) {
                          var userData = await api.userLogin(email, password);
                          if (userData != null) {
                            print('userData: $userData');
                            // var secureStorage = SecureStorage();
                            // await secureStorage.writeSecureData('userData',userData);
                          }

                          var secureStorage = SecureStorage();
                          await secureStorage.writeSecureData('userData', userData);

                          Navigator.pushNamed(
                              context, AppRoutes.profilUserScreen);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            const Text(
              'Vous n\'avez pas de compte ?',
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.registerScreen);
              },
              child: Text(
                "Creez un compte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xFF2196F3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
