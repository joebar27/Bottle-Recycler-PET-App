import 'package:flutter/material.dart';

class CustomDropdownForm extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownForm({
    required this.options,
    this.selectedOption,
    this.onChanged,
  });

  @override
  _CustomDropdownFormState createState() => _CustomDropdownFormState();
}

class _CustomDropdownFormState extends State<CustomDropdownForm> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 40,
      child: DropdownButtonFormField<String>(
        value: _selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            _selectedOption = newValue;
          });

          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(51, 75, 194, 80),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: const Color.fromARGB(255, 206, 35, 35),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: const Color.fromARGB(255, 100, 160, 20),
            ),
          ),
        ),
        items: widget.options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Container(
              child: Text(option),
            ),
          );
        }).toList(),
      ),
    );
  }
}
