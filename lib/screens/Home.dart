import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:bottlerecyclerapp/components/CustomDropdown.dart';

import '../components/ExpertForm.dart';
import '../components/NoviceForm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final secureStorage = SecureStorage();

  String jsonStringData = '';
  Map<String, dynamic> userData = {};

  String dropdownValue = 'Novice';

  @override
  void initState() {
    super.initState();
    getUserDataFromSecureStorage();
  }

  Future<Map<String, dynamic>> getUserDataFromSecureStorage() async {
    jsonStringData = await secureStorage.readSecureData('userData') ??
        'Aucun utilisateur trouvé avec cet email';
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Veuillez sélectionner le paramétrages\ndu recycleur PET',
                style: TextStyle(
                  color: Color.fromARGB(255, 12, 94, 218),
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40.0),
              Column(
                children: [
                  CustomDropdown(
                    options: ['Novice', 'Expert'],
                    selectedOption: 'Novice',
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              if (dropdownValue == 'Expert')
                // Formulaire pour 'Expert'
                ExpertForm()
              else
                // Formulaire pour 'Novice'
                NoviceForm(),
            ],
          ),
        ),
      ),
    );
  }
}
