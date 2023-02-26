import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/images.dart';



class RouteField extends StatelessWidget {
  final TextEditingController myLocationController;
  final TextEditingController goLocationController;
  final VoidCallback onPressed;
  final bool avtoFocus;
  const RouteField({Key? key, required this.myLocationController, required this.goLocationController, required this.onPressed, required this.avtoFocus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 56,
          margin: const  EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.cF4F4F4,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  TextField(
            controller: myLocationController,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            textAlignVertical: TextAlignVertical.center,
            decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.radio_button_checked_sharp, color: AppColors.c0094FF,),
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.c2AC1BC,
                    width: 2,
                  ),
                ),
                border: InputBorder.none
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 56,
          margin: const  EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.cF4F4F4,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  TextField(
            autofocus: avtoFocus,
            controller: goLocationController,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            textAlignVertical: TextAlignVertical.center,
            decoration:  InputDecoration(
                prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: AppImages.search
                ),//const Icon(CupertinoIcons.search, color: AppColors.c0094FF,),
                border: InputBorder.none,
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.c2AC1BC,
                    width: 2,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 28,
                      width: 1,
                      color: AppColors.cD6D8DD,
                    ),
                    const SizedBox(width: 9),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.c2AC1BC,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minimumSize: const Size(60, 32)
                      ),
                      child: Text('buttonCart'.tr()),
                    ),
                    const SizedBox(width: 9),
                  ],
                ),
                hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400, color: AppColors.c9DA4B1),
                hintText: 'arrivalAddress'.tr()
            ),
            onChanged: (v) =>  onPressed(),
          ),
        ),
        const SizedBox(height: 15)
      ],
    );
  }
}
