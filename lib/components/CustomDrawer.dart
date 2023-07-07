// ignore_for_file: prefer_const_constructors

import 'package:bottlerecyclerapp/core/app_export.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late Future<String?> userData;
  SecureStorage secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    userData = readUserData();
    secureStorage = SecureStorage();
  }

  Future<String?> readUserData() async {
    return await secureStorage.readSecureData('userData');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                color: Color.fromARGB(255, 99, 160, 20),
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
            decoration: BoxDecoration(
              color: Color.fromARGB(150, 99, 160, 20),
            ),
            child: Column(
              children: <Widget>[
                FutureBuilder<String?>(
                  future: userData,
                  builder:
                      (BuildContext context, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.hasData && snapshot.data != '') {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            minVerticalPadding: 20,
                            style: ListTileStyle.drawer,
                            leading: Icon(Icons.home, color: Colors.white),
                            title: Text(
                              'Extrusion',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.homeScreen);
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
                              Navigator.pushNamed(
                                  context, AppRoutes.profilUserScreen);
                            },
                          )
                        ],
                      );
                    } else {
                      return Container(); // retourne un conteneur vide si les conditions ne sont pas remplies
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.summarize,
                    color: Colors.white,
                  ),
                  title: Text('Tutoriel préparation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.tutoDebutantScreen);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromARGB(150, 99, 160, 20),
            ),
          )
        ],
      ),
    );
  }
}
