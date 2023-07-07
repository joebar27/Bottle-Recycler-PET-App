import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:bottlerecyclerapp/components/CustomDropdown.dart';
import 'package:bottlerecyclerapp/components/CustomFields.dart';
import 'package:bottlerecyclerapp/components/CustomButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final secureStorage = SecureStorage();

  String jsonStringData = '';
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    getUserDataFromSecureStorage();
  }

  Future<Map<String, dynamic>> getUserDataFromSecureStorage() async {
    jsonStringData =
        await secureStorage.readSecureData('userData') ?? 'Aucun utilisateur trouvé avec cet email';
    if (jsonStringData != 'Aucun utilisateur trouvé avec cet email') {
      userData = jsonDecode(jsonStringData);
      print('getUser: $userData');
    }

    setState(() {
      this.userData = userData['user'];
    });
    return userData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundApp,
      appBar: AppBar(
        actions: [
            IconButton(
              onPressed: () {
                secureStorage.deleteSecureData('userData');
                Navigator.pushNamed(context, AppRoutes.authScreen);
              },
              icon: Icon(Icons.login),
            ),
          ],
        backgroundColor: Color.fromARGB(255, 71, 144, 14),
        title: Text('Bottle Recycler App'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Veuillez sélectionner le paramétrages\ndu recycleur PET',
                style: TextStyle(
                  color: Color.fromARGB(255, 12, 94, 218),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                CustomDropdown(
                  options: ['Novice', 'Expert'],
                  selectedOption: 'Novice',
                  onChanged: (String? newValue) {
                    if (newValue != null) print(newValue);
                    // Traiter la nouvelle option sélectionnée ici
                  },
                ),
              ]),
              const SizedBox(height: 20.0),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(labelText: 'Type de bouteille', obscureText: false,),
                    const SizedBox(height: 12.0),
                    CustomTextFormField(labelText: 'Largeur de bande en mm', obscureText: false,),
                    const SizedBox(height: 12.0),
                    CustomTextFormField(labelText: 'Vitesse d\'extrusion en mm/s', obscureText: false,),
                    const SizedBox(height: 12.0),
                    CustomTextFormField(
                        labelText: 'Température d\'extrusion en \°C', obscureText: false,),
                    const SizedBox(height: 12.0),
                    CustomTextFormField(labelText: 'Ventilation en %', obscureText: false,),
                    const SizedBox(height: 12.0),
                    const SizedBox(height: 20.0),
                    CustomButton.primary(
                      text: 'Lancer l\'extrusion',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.tutoDebutantScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
