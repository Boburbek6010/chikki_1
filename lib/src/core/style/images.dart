
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class AppImages {
  const AppImages._();

  // *** svg images

  static final welcomeImage = SvgPicture.asset(
    'assets/images/intro_page/first_image.svg',
    height: double.infinity,
    width: double.infinity,
  );



  // !!!
  // !!!
  // !!! images

  ///  Png

  static final doneTrue = Image.asset(
    'assets/icons/registration_process/doneTrue.png',
    height: 24,
    width: 24,
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
