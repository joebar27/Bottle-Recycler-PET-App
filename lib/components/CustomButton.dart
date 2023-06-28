import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomButton({
    required this.buttonText,
    required this.onPressed,
    required this.backgroundColor,
  });

  factory CustomButton.primary({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      buttonText: text,
      onPressed: onPressed,
      backgroundColor: Color.fromARGB(255, 71, 144, 14), // Couleur d'arrière-plan personnalisée pour le bouton primaire
    );
  }

  factory CustomButton.secondary({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      buttonText: text,
      onPressed: onPressed,
      backgroundColor: Color.fromARGB(255, 216, 18, 18), // Couleur d'arrière-plan personnalisée pour le bouton secondaire
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
