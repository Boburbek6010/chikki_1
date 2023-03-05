
import 'package:demo1/src/core/style/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/colors.dart';
import '../../../../../core/style/text_style.dart';

class SearchLocationResult extends StatelessWidget {
  final String street;
  final String city;
  final VoidCallback onPressed;
  const SearchLocationResult({Key? key, required this.street, required this.city, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onPressed,
          leading:  Padding(
            padding:  const EdgeInsets.all(8.0),
            child:  AppImages.circleIndicator,
          ),
          title: Text(street, style: Theme.of(context).textTheme.titleSmall),
          subtitle: Text(city,  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.c9DA4B1, fontSize: FontSize.size12)),
          trailing:  AppImages.locationIcon,
          minVerticalPadding: 10,
          isThreeLine: false,
        ),
        const Divider(thickness: 1, indent: 75, endIndent: 20,)
      ],
    );
  }
}
