import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    required this.options,
    this.selectedOption,
    this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption;
  }

  @override
Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.3,
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
        fillColor: Color.fromARGB(51, 75, 194, 80),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: widget.options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3, // Ajustez la largeur selon vos besoins
            child: Text(option),
          ),
        );
      }).toList(),
    ),
  );
}

}
