import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:bottlerecyclerapp/data/local_storage/secure_storage.dart';
// import 'package:bottlerecyclerapp/data/apiClient/api_client.dart' as api;

class ProfilUserScreen extends StatefulWidget {
  const ProfilUserScreen({Key? key}) : super(key: key);

  @override
  _ProfilUserScreenState createState() => _ProfilUserScreenState();
}

class _ProfilUserScreenState extends State<ProfilUserScreen> {
  // final storage = FlutterSecureStorage();
  String email = storage.read(key:'email') as String;
  String value = await storage.read(key: 'email') ?? 'No data found';
  String? password;

  // @override
  // void initState() {
  // super.initState();
  // final email = storage.read(key: 'email');
  // SecureStorage().readSecureData('email');
  // .then((value) {
  //   setState(() {
  //     email = value;
  //   });
  // }
  // api.userData(email, password).then((data) {
  //   setState(() {
  //     userData = data;
  //   });
  // }).catchError((error) {
  //   // Gérer les erreurs de récupération des données de l'utilisateur
  //   print(
  //       'Erreur lors de la récupération des données de l\'utilisateur : $error');
  // });
  // print('storage email: $email');
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.backgroundApp,
        // backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: getPadding(
                  left: 10,
                  top: 11,
                  right: 10,
                  bottom: 11,
                ),
                decoration: AppDecoration.fillLightgreen800,
                child: Row(
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getVerticalSize(
                              5,
                            ),
                            width: getHorizontalSize(
                              30,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              5,
                            ),
                            width: getHorizontalSize(
                              30,
                            ),
                            margin: getMargin(
                              top: 4,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: getVerticalSize(
                              5,
                            ),
                            width: getHorizontalSize(
                              30,
                            ),
                            margin: getMargin(
                              top: 4,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.whiteA700,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 32,
                        top: 4,
                      ),
                      child: Text(
                        "PET bottle recycler",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoRegular24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  171,
                ),
                margin: getMargin(
                  top: 23,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Bienvenue",
                        style: TextStyle(
                          color: ColorConstant.blue800,
                          fontSize: getFontSize(
                            18,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: " ",
                        style: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(
                            18,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '$email',
                        style: TextStyle(
                          color: ColorConstant.redA700Ad,
                          fontSize: getFontSize(
                            18,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: "sur votre profile",
                        style: TextStyle(
                          color: ColorConstant.blue800,
                          fontSize: getFontSize(
                            18,
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
                margin: getMargin(
                  top: 31,
                ),
                padding: getPadding(
                  left: 30,
                  top: 1,
                  right: 123,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "Nom",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 114,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "Prénom",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 122,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "Email",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 104,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "Téléphone",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 72,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "Mot de passe actuel",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRegular14,
                ),
              ),
              Container(
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
              Padding(
                padding: getPadding(
                  top: 11,
                ),
                child: Text(
                  "Grade actuel :",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 96,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "“PETty Master”",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  textAlign: TextAlign.left,
                  style: AppStyle.txtRobotoRegular14Lightgreen800,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  280,
                ),
                margin: getMargin(
                  left: 40,
                  top: 2,
                  right: 40,
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
                        textAlign: TextAlign.left,
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
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 114,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "8 mètres",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
                  textAlign: TextAlign.left,
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
                  left: 30,
                  top: 1,
                  right: 111,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineLightgreen900,
                child: Text(
                  "16 mètres",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
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
