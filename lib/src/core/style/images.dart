
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class AppImages {
  const AppImages._();

  // *** svg images

  static final welcomeImageSvg = SvgPicture.asset(
    'assets/images/intro_page/first_image.svg',
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.cover,
  );



  // !!!
  // !!!
  // !!! images

  ///  Png

  static final welcomeImage = Image.asset(
    'assets/images/intro_page/welcome_image.png',
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.cover,
  );

  static final welcomeArm = Image.asset(
    'assets/images/intro_page/arm.png',
    height: 50,
    width: 50,
    fit: BoxFit.cover,
  );

  static final introImage1 = Image.asset(
    'assets/images/intro_page/taxi3.jpg',
    height: 253,
    width: 271,
    fit: BoxFit.cover,
  );

  static final introImage2 = Image.asset(
    'assets/images/intro_page/taxi2.jpg',
    height: 253,
    width: 271,
    fit: BoxFit.cover,
  );

  static final introImage3 = Image.asset(
    'assets/images/intro_page/taxi1.png',
    height: 253,
    width: 271,
    fit: BoxFit.cover,
  );

  static final profilePerson = Image.asset(
    'assets/images/login/person.png',
    height: 48,
    width: 48,
    fit: BoxFit.contain,
  );

  static final camera = Image.asset(
    'assets/images/login/camera.png',
    height: 24,
    width: 24,
    fit: BoxFit.contain,
  );

  static final gallery = Image.asset(
    'assets/images/login/gallery.png',
    height: 24,
    width: 24,
    fit: BoxFit.contain,
  );
}

// extension CustomSvg on SvgPicture {
//   SvgPicture copyWith({
//     double? width,
//     double? height,
//     BoxFit? fit,
//     Color? color,
//   }) {
//     final picture = pictureProvider as ExactAssetPicture;
//     if (colorFilter != null) {
//       var colorString = '$colorFilter'.substring('$colorFilter'.indexOf('value: Color(') + 13);
//       colorString = colorString.substring(0, colorString.indexOf(')),'));
//       color ??= Color(int.parse(colorString));
//     }
//     return SvgPicture.asset(
//       picture.assetName,
//       width: width ?? this.width,
//       height: height ?? this.height,
//       fit: fit ?? this.fit,
//       color: color,
//     );
//   }
//
//   String get path => (pictureProvider as ExactAssetPicture).assetName;
// }

extension Extension on Image {
  Image copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      Image(
        image: image,
        width: width ?? this.width,
        height: height ?? this.height,
        fit: fit ?? this.fit,
        color: color ?? this.color,
      );
}
