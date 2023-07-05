import 'dart:convert';

import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/data/local_storage/secure_storage.dart';

class ProfilUserScreen extends StatefulWidget {
  const ProfilUserScreen({Key? key}) : super(key: key);

  @override
  _ProfilUserScreenState createState() => _ProfilUserScreenState();
}

class _ProfilUserScreenState extends State<ProfilUserScreen> {
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

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          centerTitle: true,
          title: Text("Profile", style: AppStyle.txtRobotoRegular24),
          backgroundColor: Color.fromARGB(255, 71, 144, 14),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getHorizontalSize(
                  200,
                ),
                margin: getMargin(
                  top: 20,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Bienvenue\n",
                        style: TextStyle(
                          color: ColorConstant.blue800,
                          fontSize: getFontSize(
                            22,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: userData['username'] != null
                            ? capitalizeFirstLetter(userData['username'])
                            : 'Default Username',
                        style: TextStyle(
                          color: ColorConstant.redA700Ad,
                          fontSize: getFontSize(
                            22,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "\nsur votre profile",
                        style: TextStyle(
                          color: ColorConstant.blue800,
                          fontSize: getFontSize(
                            22,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                height: getVerticalSize(25),
                margin: getMargin(
                  top: 31,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  textAlign: TextAlign.center,
                  userData['name'].toString(),
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.txtRobotoRegular16,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  top: 12,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  userData['username'].toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  top: 12,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  userData['email'].toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  top: 12,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  userData['phone'].toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
                },
                child: Container(
                  width: getHorizontalSize(
                    200,
                  ),
                  margin: getMargin(
                    top: 12,
                  ),
                  padding: getPadding(
                    left: 8,
                    top: 1,
                    right: 8,
                    bottom: 1,
                  ),
                  decoration: AppDecoration.txtOutlineLightgreen9001.copyWith(
                    borderRadius: BorderRadiusStyle.txtRoundedBorder5,
                  ),
                  child: Text(
                    "Modifier mon mot de passe",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRegular14WhiteA700,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 11,
                ),
                child: Text(
                  "Grade actuel :",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14Lightgreen800,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  top: 3,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "“PETty Master”",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular12,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 4,
                ),
                child: Text(
                  "Prochain grade :",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14Lightgreen800,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  left: 10,
                  top: 2,
                  right: 10,
                ),
                padding: getPadding(
                  all: 1,
                ),
                decoration: AppDecoration.outlineLightgreen900,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        177,
                      ),
                      padding: getPadding(
                        all: 1,
                      ),
                      decoration: AppDecoration.txtGradientBlueA100ccBlueA100cc,
                      child: Text(
                        "“Bottle Guru”",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtRobotoRegular12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Text(
                  "Dernière extrusion de PET :",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14Lightgreen800,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  top: 3,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "8 mètres",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular12Lightgreen800,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Text(
                  "Extrusion total de PET :",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular14Lightgreen800,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  top: 3,
                  bottom: 5,
                ),
                padding: getPadding(
                  left: 10,
                  top: 1,
                  right: 10,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "16 mètres",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular12Lightgreen800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
