// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {super.key, required String labelText, required bool isSecret});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecret = false;
  String _labelText = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => setState(() => _email = value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez saisir votre adresse email';
        }
        return null;
      },
      obscureText: _isSecret,
      decoration: InputDecoration(
        labelText: _labelText,
        suffixIcon: InkWell(
          onTap: () => setState(() => _isSecret = !_isSecret),
          child: Icon(
            !_isSecret ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
        // labelText: _labelText,
        filled: true,
        fillColor: Color.fromARGB(51, 75, 194, 80),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Color.fromARGB(255, 100, 160, 20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
