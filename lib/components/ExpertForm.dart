import 'package:bottlerecyclerapp/components/CustomButton.dart';
import 'package:bottlerecyclerapp/components/CustomFields.dart';
import 'package:bottlerecyclerapp/core/app_export.dart';

class ExpertForm extends StatefulWidget {
  const ExpertForm({super.key});

  @override
  State<ExpertForm> createState() => _ExpertFormState();
}

class _ExpertFormState extends State<ExpertForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            labelText: 'Nom du profile de la bouteille',
            obscureText: false,
          ),
          const SizedBox(height: 12.0),
          CustomTextFormField(
            labelText: 'Largeur de bande en mm',
            obscureText: false,
          ),
          const SizedBox(height: 12.0),
          CustomTextFormField(
            labelText: 'Vitesse d\'extrusion en mm/s',
            obscureText: false,
          ),
          const SizedBox(height: 12.0),
          CustomTextFormField(
            labelText: 'Température d\'extrusion en \°C',
            obscureText: false,
          ),
          const SizedBox(height: 12.0),
          CustomTextFormField(
            labelText: 'Ventilation en %',
            obscureText: false,
          ),
          const SizedBox(height: 32.0),
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
