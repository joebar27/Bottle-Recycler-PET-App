import 'package:bottlerecyclerapp/components/CustomButton.dart';
import 'package:bottlerecyclerapp/components/CustomDropdownForm.dart';
import 'package:bottlerecyclerapp/core/app_export.dart';

class NoviceForm extends StatefulWidget {
  const NoviceForm({super.key});

  @override
  State<NoviceForm> createState() => _NoviceFormState();
}

class _NoviceFormState extends State<NoviceForm> {
  String dropdownNameValue = 'Coca Cola 1L75';
  String dropdownWidthValue = '7 mm';
  String dropdownSpeedValue = '40 mm/s';
  String dropdownTempValue = '200 °C';
  String dropdownFanValue = 'OFF';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomDropdownForm(
            options: ['Coca Cola 1L75', 'Coca Cola 2L', 'Coca Cola 1L25'],
            selectedOption: 'Coca Cola 1L75',
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropdownNameValue = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20.0),
          CustomDropdownForm(
            options: ['7 mm', '7.5 mm', '8 mm', '8.5 mm', '9 mm', '9.5 mm'],
            selectedOption: '7 mm',
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropdownWidthValue = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20.0),
          CustomDropdownForm(
            options: [
              '30 mm/s',
              '40 mm/s',
              '50 mm/s',
              '60 mm/s',
              '70 mm/s',
              '80 mm/s'
            ],
            selectedOption: '40 mm/s',
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropdownSpeedValue = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20.0),
          CustomDropdownForm(
            options: ['200°C', '210°C', '220°C', '230°C', '240°C', '250°C'],
            selectedOption: '200°C',
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropdownTempValue = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20.0),
          CustomDropdownForm(
            options: ['ON', 'OFF'],
            selectedOption: 'OFF',
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropdownFanValue = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 50.0),
              CustomButton.primary(
                text: 'Lancer l\'extrusion',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.extrudeActiveScreen);
                },
              ),
        ],
      ),
    );
  }
}









// CustomDropdownForm(
//         labelText: 'Type de bouteille',
//         value: 'Bouteille de lait',
//         onChanged: (String? newValue) {
//           setState(() {
//             dropdownValue = newValue!;
//           });
//         },
//         items: <String>[
//           'Bouteille de lait',
//           'Bouteille de soda',
//           'Bouteille d\'eau',
//           'Bouteille de vin'
//         ].map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value, style: TextStyle(color: Colors.black)),
//           );
//         }).toList(),
//       ),
      