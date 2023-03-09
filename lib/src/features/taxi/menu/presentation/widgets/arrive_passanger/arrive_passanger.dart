import 'package:Chikki/src/features/taxi/menu/view_model/home_view_model.dart';
import 'package:Chikki/src/features/taxi/welcome/presentation/widgets/intro_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import '../../../../../../core/style/colors.dart';
import '../../../../../../core/style/images.dart';

class ArrivePassenger extends ConsumerWidget {
  final VoidCallback ratingAction;
  const ArrivePassenger({Key? key, required this.ratingAction}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('1 min qoldi', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600)),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 12,),
                    ],
                  ),
                  const SizedBox(width: 17),
                  Text('Yetkazish qanday boldi?', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.black, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox.shrink(),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 28,
                    width: 97,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.cEDEDED,
                    ),
                    child: Text('01 T 202 AA', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.black), textAlign: TextAlign.start) ,
                  ),
                  Transform.translate(
                      offset: const Offset(5, -5),
                      child: AppImages.infoCar)
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1),

          const SizedBox(height: 24),
          //driverInfo arrived
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //driverName
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cEDEDED,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AppImages.driver,
                        Transform.translate(
                          offset: const Offset(23, -18),
                          child: Container(
                            alignment: Alignment.center,
                            height: 18,
                            width: 31,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(0,1),
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      spreadRadius: 1
                                  )
                                ]
                            ),
                            child: Text('4.57', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Akbar', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292))
                ],
              ),

              //#sefity
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cEDEDED,
                    ),
                    child: AppImages.safetyCar,
                  ),
                  const SizedBox(height: 8),
                  Text('Havfsizlik', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292))
                ],
              ),

              //massage With driver
              Column(
                children: [
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cEDEDED,
                    ),
                    child: AppImages.layerCar,
                  ),
                  const SizedBox(height: 8),
                  Text('Filtr', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c929292))
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(thickness: 1),
          const SizedBox(height: 20),

          Center(
            child: SmoothStarRating(
              rating: ref.read(homeVM).ratingA,
              size: 50,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border,
              starCount: 5,
              allowHalfRating: true,
              color: AppColors.c2AC1BC,
              borderColor: AppColors.c2AC1BC,
              spacing: 2.0,
              onRatingChanged: (value) {
                ref.read(homeVM).ratingA = value;
               ratingAction();
              },
            ),
          ),
          const SizedBox(height: 17),
        ],
      ),
    );
  }
}


