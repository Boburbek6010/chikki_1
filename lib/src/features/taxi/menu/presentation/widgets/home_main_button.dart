import 'package:demo1/src/core/style/colors.dart';
import 'package:flutter/material.dart';

class HomeMainButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  const HomeMainButton({required this.name, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.c2AC1BC,
      ),
      child: MaterialButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          name, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
    );
  }
}
