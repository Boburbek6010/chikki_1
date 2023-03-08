import 'package:Chikki/src/core/style/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/style/colors.dart';
import '../widgets/category_w.dart';
class FoodCategory extends StatelessWidget {
  const FoodCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          splashRadius: 25,
          icon: const Icon(CupertinoIcons.arrow_left),
        ),
        actions: [
          ElevatedButton(
          onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.transparent,
              minimumSize:  const Size(17, 17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )
            ),
            child: AppImages.homeSearch,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appBarImage
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              AppImages.foodAppBar,
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                height: 27,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.white
                ),
                child: Text('15-30 min', style: Theme.of(context).textTheme.labelMedium,),
              )
            ],
          ),
          //description
          Container(
            child: AppImages.price,
          ),

          Container(
            color: AppColors.white,
              height: 40,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15),
              child: Text('Setlar', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 21))),

           Expanded(
             child: ListView.builder(
               padding: const EdgeInsets.symmetric(vertical: 20),
               physics: const BouncingScrollPhysics(),
               itemCount: 10,
               itemBuilder: (context, index){
                 return const FoodWidget();
               },
             ),
           ),

        ],
      ),
    );
  }
}
