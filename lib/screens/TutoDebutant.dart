import 'package:flutter/material.dart';
import '../core/app_export.dart';

class TutoDebutantScreen extends StatelessWidget {
  const TutoDebutantScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
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
                                style: AppStyle.txtInterRegular24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          204,
                        ),
                        margin: getMargin(
                          top: 4,
                        ),
                        child: Text(
                          "Bienvenue sur le\ntutoriel d’utilisation\nde l’extrudeuse PET",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtPoppinsBold20,
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          312,
                        ),
                        margin: getMargin(
                          left: 23,
                          top: 47,
                          right: 23,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "La préparation des bouteilles :\n",
                                style: TextStyle(
                                  color: ColorConstant.lightGreen800,
                                  fontSize: getFontSize(
                                    18,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Avant toute utilisation de l’extrudeuse à filament, il est nécessaire de préparer chaque bouteille récupérer de manière soigneuse afin d’obtenir le meilleur résultat de production de filament en PET.\n\n",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: getHorizontalSize(
                            313,
                          ),
                          margin: getMargin(
                            left: 15,
                            top: 27,
                            right: 31,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      "Pour cela rien de plus simple, munissez vous :\n",
                                  style: TextStyle(
                                    color: ColorConstant.lightGreen800,
                                    fontSize: getFontSize(
                                      15,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: "",
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "D’une valve de vélo ou voiture.\nD’une pompe a vélo.\nD’un bouchon servant à fermer la bouteille à recycler.\nDe quoi percer et collé.\nD’un décapeur thermique ou toute autre source de chaleur suffisamment forte pour chauffer le plastique.\nD’un chiffon et de White-spirit",
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          325,
                        ),
                        margin: getMargin(
                          left: 15,
                          top: 23,
                          right: 19,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Première étape :\n",
                                style: TextStyle(
                                  color: ColorConstant.lightGreen800,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    16,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "Retirer l’étiquette de la bouteille (garder la, elle pourra vous servir pour étiqueter vos filaments extrudés).\n\n    Imbiber légèrement le chiffon de White-spirit, pour retirer la couche de colle qui serait éventuellement resté suite au retrait de l’étiquette.\n\n    Prenez le bouchon de la bouteille et y faire un trou du diamètre de votre valve afin de réalisé une étanchéité la plus parfaite possible lorsque vous allez insérer la valve dans le trou du bouchon, pour y arrivé ajouté de la colle dans le bouchon percé avant d’y introduire la valve.",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 17,
                          top: 24,
                          right: 18,
                        ),
                        padding: getPadding(
                          left: 6,
                          right: 6,
                        ),
                        decoration: AppDecoration.outlineRedA700ad.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgImage9,
                              height: getSize(
                                55,
                              ),
                              width: getSize(
                                55,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: getHorizontalSize(
                                  247,
                                ),
                                margin: getMargin(
                                  left: 10,
                                  bottom: 6,
                                ),
                                child: Text(
                                  "Il serra nécessaire de répéter l’opération autant de fois que de type de bouchon existant sur vos bouteilles à extruder.",
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRobotoRomanRegular14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 15,
                            top: 24,
                          ),
                          child: Text(
                            "Seconde étape :",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtRobotoRomanSemiBold16Lightgreen800,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          330,
                        ),
                        margin: getMargin(
                          left: 15,
                          top: 13,
                          right: 15,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "    Rincer correctement votre bouteille et ajouter y votre nouvelle conception de bouchon, connecter y la pompe a vélo et gonflé la bouteille à ",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "environ 1 Bar de pression.\n\n    Passer votre bouteille au dessus de la source de chaleur, pas trop près pour ne pas cristallisé votre plastique de bouteille, qui serrai inutilisable par la suite.\n    Le but étant de gommer toutes les petites rainure, bosse ou creux de la bouteille ",
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(
                                    14,
                                  ),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 15,
                            top: 36,
                          ),
                          child: Text(
                            "Troisième étape :",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtRobotoRomanSemiBold16Lightgreen800,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          327,
                        ),
                        margin: getMargin(
                          left: 15,
                          top: 9,
                          right: 17,
                        ),
                        child: Text(
                          "    Découper le fond de la bouteille en faisant attention de garder le maximum de matière et le plus droit possible.\n\n    Essuyer l’intérieur de la bouteille, afin qu’il n’y reste plus aucune trace d’humidité sur les parois.\n\n    La partie la plus délicate est la suivante, découper un début de bande sur environ 15 cm et sur une largeur de 1,5 mm, afin de pouvoir dans un premier temps, introduire cette longueur de bande dans le cutter à roulement puis dans l’extrudeuse jusqu’à ce qu’elle ressorte de l’autre coté par la buse ( d’un diamètre de 1,75 mm ).",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanRegular14,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 15,
                            top: 34,
                          ),
                          child: Text(
                            "Quatrième étape :",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style:
                                AppStyle.txtRobotoRomanSemiBold16Lightgreen800,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          320,
                        ),
                        margin: getMargin(
                          left: 15,
                          top: 21,
                          right: 24,
                          bottom: 214,
                        ),
                        child: Text(
                          "    Il est temps maintenant de lancer votre extrusion de filament, pour cela connecté votre mobile au réseau wifi de votre habitation, ainsi que la machine à extruder.\n\n    Raccorder à l’aide du domino, votre début de bande bien solidement.\n\n    Renseigner tout les paramètres qui correspond a votre bouteille à extruder.\n\n    Lancer votre extrusion et contempler le résultat.",
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRobotoRomanRegular14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
