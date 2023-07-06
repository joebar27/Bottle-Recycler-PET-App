import 'package:bottlerecyclerapp/core/app_export.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
        await secureStorage.readSecureData('userData') ?? 'No data found';
    if (jsonStringData != 'No data found') {
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
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ChangePasswordScreen en construction',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: MediaQuery.of(context).size.height*0.01,
                  color: ColorConstant.redA700,
                  fontSize: getFontSize(
                    30,
                  ),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
                
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
