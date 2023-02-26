import 'package:demo1/src/core/style/images.dart';
import 'package:demo1/src/core/style/text_style.dart';
import 'package:demo1/src/data/entity/yandex_routes.dart';
import 'package:demo1/src/features/order/view_model/search_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/style/colors.dart';

class SearchRoutScreen extends ConsumerWidget {
  const SearchRoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(searchRouteVM);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () => ref.read(searchRouteVM).closePage(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.c9DA4B1, size: 22,),
        ),
        title: Text('yourRout'.tr(), style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: (){},
              splashRadius: 25,
              icon: const Icon(Icons.add, size: 30, color: AppColors.black,),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            margin: const  EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.cF4F4F4,
              borderRadius: BorderRadius.circular(12),
            ),
            child:  TextField(
              controller: ref.read(searchRouteVM).myLocationController,
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
               controller: ref.read(searchRouteVM).goLocationController,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
              textAlignVertical: TextAlignVertical.center,
              decoration:  InputDecoration(
                prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: AppImages.search),//const Icon(CupertinoIcons.search, color: AppColors.c0094FF,),
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
              onChanged: ref.watch(searchRouteVM).searchLocate,
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: ref.watch(searchRouteVM).locate.length,
              itemBuilder: (context, index){
                Feature locate = ref.read(searchRouteVM).locate[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                 // mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   ListTile(
                     leading: const Padding(
                       padding:  EdgeInsets.all(8.0),
                       child:  Icon(Icons.radio_button_off, weight: 4, color: AppColors.c9DA4B1, size: 20,),
                     ),
                     title: Text(locate.properties.name, style: Theme.of(context).textTheme.titleSmall),
                     subtitle: Text(locate.properties.description,  style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.c9DA4B1, fontSize: FontSize.size12)),
                     trailing: const Icon(CupertinoIcons.location_solid),
                      minVerticalPadding: 10,
                       isThreeLine: false,
                   ),
                   const Divider(thickness: 1, indent: 75, endIndent: 20,)

                 ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
