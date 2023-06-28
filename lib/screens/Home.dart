import 'package:bottlerecyclerapp/components/CustomDropdown.dart';
import 'package:bottlerecyclerapp/components/CustomFields.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Paramètrage d\'extrusion'),
          backgroundColor: Color.fromARGB(255, 71, 144, 14)),
      body: Padding(
          padding: EdgeInsets.all(30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 20.0),
            const Text(
              'Veuillez sélectionner le paramétrages\ndu recycleur PET',
              style: TextStyle(
                color: Color.fromARGB(255, 12, 94, 218),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: CustomDropdown(
                options: ['Novice', 'Expert'],
                selectedOption: 'Novice',
                onChanged: (String? newValue) {
                  // Traiter la nouvelle option sélectionnée ici
                },
              ),
            ),
            const SizedBox(height: 20.0),
            CustomTextField(labelText: 'Type de bouteille'),
            const SizedBox(height: 12.0),
            CustomTextField(labelText: 'Largeur de bande en mm'),
            const SizedBox(height: 12.0),
            CustomTextField(labelText: 'Vitesse d\'extrusion en mm/s'),
            const SizedBox(height: 12.0),
            CustomTextField(labelText: 'Température d\'extrusion en \°C'),
            const SizedBox(height: 12.0),
            CustomTextField(labelText: 'Ventilation en %'),
            const SizedBox(height: 12.0),
          ])),
    );
  }
}
