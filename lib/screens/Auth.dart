import 'package:bottlerecyclerapp/components/CustomFields.dart';
import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/components/CustomButton.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Connexion'),
      // ),
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
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Bottle Recycler App',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Image.asset(
              'assets/images/bouteille_bobine_pet.png', // Remplacez "assets/logo.png" par le chemin de votre image
              height: MediaQuery.of(context).size.height * 0.25,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextField(labelText: 'E-mail', obscureText: false,),
                  const SizedBox(height: 12.0),
                  CustomTextField(labelText: 'Mot de passe', obscureText: true),
                  const SizedBox(height: 50.0),
                  CustomButton.primary(
                    text: 'Se connecter',
                    onPressed: () {
                      // if (_formKey.currentState?.validate() == true) {
                      //   _formKey.currentState?.save();
                      // Effectuer la validation et la connexion ici
                      // Utilisez les valeurs _email et _password pour la connexion
              
                      Navigator.pushNamed(context, '/home');
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
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                "Creez un compte",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
