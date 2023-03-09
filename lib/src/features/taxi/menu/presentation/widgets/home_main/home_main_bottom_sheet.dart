import 'package:Chikki/src/core/routes/app_route_name.dart';
import 'package:Chikki/src/features/taxi/menu/presentation/widgets/home_drawer_builder.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/style/colors.dart';
import '../../../../../../core/style/images.dart';

class HomeMainBottomSheet extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onDrawerBuilderPressed;
  const HomeMainBottomSheet({required this.onDrawerBuilderPressed, Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeDrawerBuilder(
          openDrawer: onDrawerBuilderPressed,
          child: AppImages.homeLeadingButton,
        ),
        Container(
          height: 170,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),

              ///top indicator
              Container(
                height: 5,
                width: 45,
                decoration: BoxDecoration(
                    color: AppColors.cE8E9EB,
                    borderRadius: BorderRadius.circular(10)),
              ),

              const SizedBox(
                height: 10,
              ),

              /// qayerga boramiz
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.cE8E9EB),
                child: MaterialButton(
                  splashColor: AppColors.c6F767E,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  onPressed: onTap,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      AppImages.homeModalBottomSheetCar,
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Qayerga boramiz?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              /// yo'l-yo'lakay, chikki food
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 15,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cE8E9EB),
                      child: MaterialButton(
                        splashColor: AppColors.c6F767E,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRouteName.YWELCOME);
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              AppImages.homeModalBottomSheetCar,
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Yo’l-yo’lakay",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 15,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cE8E9EB),
                      child: MaterialButton(
                        splashColor: AppColors.c6F767E,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRouteName.FWELCOME);
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              AppImages.homeChikkiFood,
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Chikki food",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
