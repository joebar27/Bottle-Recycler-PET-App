import 'package:flutter/material.dart';

class ExtrudeActiveScreen extends StatefulWidget {
  const ExtrudeActiveScreen({super.key});

  @override
  State<ExtrudeActiveScreen> createState() => _ExtrudeActiveState();
}

class _ExtrudeActiveState extends State<ExtrudeActiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('ExtrudeActive'),
      ),
    );
  }
}
