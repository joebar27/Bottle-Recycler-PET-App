// ignore_for_file: prefer_const_constructors

import 'package:bottlerecyclerapp/core/app_export.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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
    return AppBar(
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
    );
  }
}
