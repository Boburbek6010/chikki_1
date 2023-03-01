import 'package:demo1/src/core/global_keys.dart';
import 'package:demo1/src/data/entity/yandex_routes.dart';
import 'package:demo1/src/features/order/view_model/search_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

import '../../../../core/style/colors.dart';
import '../../../menu/view_model/home_view_model.dart';
import '../widgets/search_locations.dart';
import '../widgets/search_route.dart';

class SearchRoutScreen extends ConsumerWidget {
  final String? myLocate;
  const SearchRoutScreen({Key? key, this.myLocate}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(searchRouteVM);
    ref.read(searchRouteVM).myLocationController.text = myLocate ?? 'error';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            isManualMapChosen = false;
            ref.read(searchRouteVM).closePage(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.c9DA4B1, size: 22,),
        ),
        title: Text('yourRout'.tr(), style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: (){},
              splashRadius: 25,
              icon: const Icon(Icons.add, size: 30, color: AppColors.black,),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: RouteField(
              myLocationController: ref.read(searchRouteVM).myLocationController,
              goLocationController: ref.read(searchRouteVM).goLocationController,
              onPressed: () {
                Navigator.of(context).pop();
                if(ref.read(searchRouteVM).goLocationController.text.trim() != ''){
                  l.d('gooo');
                  ref.read(searchRouteVM).getAllProperties();
                }
                ref.watch(searchRouteVM).searchLocate(ref.watch(searchRouteVM).goLocationController.text);
              }),
        ),
      ),
      body: ListView.builder(
        itemCount: ref.watch(searchRouteVM).locate.length,
        itemBuilder: (context, index){
          Feature locate = ref.read(searchRouteVM).locate[index];
          return SearchLocationResult(street: locate.properties.name, city: locate.properties.description, onPressed: () => ref.read(searchRouteVM).selectLocate(index, locate.properties.name),);
        },
      ),
    );
  }
}
