
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/style/colors.dart';
import '../../../../core/style/text_style.dart';

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
          leading: const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Icon(Icons.radio_button_off, weight: 4, color: AppColors.c9DA4B1, size: 20,),
          ),
          title: Text(street, style: Theme.of(context).textTheme.titleSmall),
          subtitle: Text(city,  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.c9DA4B1, fontSize: FontSize.size12)),
          trailing: const Icon(CupertinoIcons.location_solid),
          minVerticalPadding: 10,
          isThreeLine: false,
        ),
        const Divider(thickness: 1, indent: 75, endIndent: 20,)
      ],
    );
  }
}
