import 'package:Chikki/src/data/entity/yandex_routes.dart';
import 'package:Chikki/src/features/taxi/order/view_model/search_route.dart';
import 'package:Chikki/src/features/taxi/settings/checker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l/l.dart';

import '../../../../../core/style/colors.dart';
import '../widgets/search_locations.dart';
import '../widgets/search_route.dart';

class SearchRoutScreen extends ConsumerWidget {
  final String? myLocate;
  const SearchRoutScreen({Key? key, this.myLocate}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(searchRouteVM);
    ref.watch(checker);
    ref.read(searchRouteVM).myLocationController.text = myLocate ?? 'error';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        leading: IconButton(
          splashRadius: 25,
          onPressed: () {
            ref.read(checker).sBackFromSearchToHomeFalse();
            Navigator.of(context).pop();
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
            text: ref.read(searchRouteVM).goLocationController.text,
              myLocationController: ref.read(searchRouteVM).myLocationController,
              goLocationController: ref.read(searchRouteVM).goLocationController,
              onPressed: () {
                // Navigator.of(context).pop();
                if(ref.read(searchRouteVM).goLocationController.text.trim() != ''){
                  l.d('gooo');
                  ref.read(searchRouteVM).getAllProperties();
                }
                ref.watch(searchRouteVM).searchLocate(ref.watch(searchRouteVM).goLocationController.text);
              },
              onCardPressed: () {
                var a = ref.read(searchRouteVM).goLocationController.text;
                ref.read(checker).sBackFromSearchToHome();
                Navigator.of(context).pop(a);
                l.w(a);
          },),
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
