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
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 100, 160, 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //! header du drawer :
            Container(
              height: 100,
              child: DrawerHeader(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 100, 160, 20),
                ),
                child: Container(
                  height: 30,
                  child: Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //! liste des items du drawer :
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    style: ListTileStyle.drawer,
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.homeScreen);
                      },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.summarize,
                      color: Colors.white,
                    ),
                    title: Text('Tutoriel Débutant',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.tutoDebutantScreen);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    title: Text('Profil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        )),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profilUserScreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
