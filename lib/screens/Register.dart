import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/components/CustomButton.dart';
import 'package:bottlerecyclerapp/components/CustomFormFields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundApp,
      appBar: AppBar(
          title: const Text('Créer un compte'),
          backgroundColor: Color.fromARGB(255, 71, 144, 14)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
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
            CustomImageView(
              imagePath: ImageConstant.imgImage1,
              height: getSize(
                150,
              ),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Inscrivez-vous pour continuer\nc\'est gratuit',
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
                  CustomFormField(
                    labelText: 'Nom',
                    obscureText: false,
                  ),
                  const SizedBox(height: 12.0),
                  CustomFormField(
                    labelText: 'Prénom',
                    obscureText: false,
                  ),
                  const SizedBox(height: 12.0),
                  CustomFormField(
                    labelText: 'E-mail',
                    obscureText: false,
                  ),
                  const SizedBox(height: 12.0),
                  CustomFormField(
                    labelText: 'Mot de passe',
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  CustomFormField(
                    labelText: 'Confirmer le mot de passe',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30.0),
                  CustomButton.secondary(
                    text: 'S\'inscrire',
                    onPressed: () {
                      Navigator.pushNamed(context, '/TutoDebutant');
                    },
                  ),
                ],
              ),
            ),
            // CustomTextField(
            //   labelText: 'Nom Prénom',
            // ),
            // const SizedBox(height: 12.0),
            // CustomTextField(
            //   labelText: 'E-mail',
            // ),
            // const SizedBox(height: 12.0),
            // CustomTextField(
            //   labelText: 'Mot de passe',
            // ),
            // const SizedBox(height: 12.0),
            // CustomTextField(
            //   labelText: 'Confirmer le mot de passe',
            // ),
            // const SizedBox(height: 30.0),
            // CustomButton.secondary(
            //   text: 'S\'inscrire',
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/auth');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
