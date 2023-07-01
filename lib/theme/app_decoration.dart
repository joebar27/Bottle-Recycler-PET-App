import 'package:flutter/material.dart';
import 'package:bottlerecyclerapp/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineLightgreen900 => BoxDecoration(
        color: ColorConstant.green50033,
        border: Border.all(
          color: ColorConstant.lightGreen900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineLightgreen800 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.lightGreen800,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutlineBlack900 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get gradientBlueA100ccBlueA100cc => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            1,
            0.5,
          ),
          end: Alignment(
            0,
            0.5,
          ),
          colors: [
            ColorConstant.blueA100Cc,
            ColorConstant.blueA100Cc,
          ],
        ),
      );
  static BoxDecoration get fillBlueA1005a => BoxDecoration(
        color: ColorConstant.blueA1005a,
      );
  static BoxDecoration get fillRedA70048 => BoxDecoration(
        color: ColorConstant.redA70048,
      );
  static BoxDecoration get fillLightgreen800 => BoxDecoration(
        color: ColorConstant.lightGreen800,
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineRedA700ad => BoxDecoration(
        border: Border.all(
          color: ColorConstant.redA700Ad,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutlineLightgreen9001 => BoxDecoration(
        color: ColorConstant.lightGreen800,
        border: Border.all(
          color: ColorConstant.lightGreen900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtGradientBlueA100ccBlueA100cc => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            1,
            0.5,
          ),
          end: Alignment(
            0,
            0.5,
          ),
          colors: [
            ColorConstant.blueA100Cc,
            ColorConstant.blueA100Cc,
          ],
        ),
      );
  static BoxDecoration get txtOutlineLightgreen900 => BoxDecoration(
        color: ColorConstant.green50033,
        border: Border.all(
          color: ColorConstant.lightGreen900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutlineBlack9003f => BoxDecoration();
  static BoxDecoration get txtOutlineLightgreen800 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.lightGreen800,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),
  );

  static BorderRadius txtRoundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
