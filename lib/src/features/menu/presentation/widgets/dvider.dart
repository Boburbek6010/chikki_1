import 'package:demo1/src/core/style/colors.dart';
import 'package:demo1/src/core/style/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DividerW extends StatelessWidget {
  const DividerW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),

        //#shopir
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.cF4F4F4
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.white,
              child: AppImages.driver,
            ),
            title: Text('Rakhmonov Islom', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.c091B3D)),
            subtitle: Text('+998 (97) 448-15-12', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.c9DA4B1, fontWeight: FontWeight.w600),),
            trailing: Transform.translate(
              offset: const Offset(19, 0),
              child: IconButton(
                splashRadius: 25,
                onPressed: (){},
                icon: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.black, size: 18,),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Divider(thickness: 1),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 19),
          child: Column(
            children: [
              Row(
                children: [
                  AppImages.card,
                  const SizedBox(width: 13),
                  Text('Doimiy yo’nalishlar', style: Theme.of(context).textTheme.labelLarge,),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, indent: 40,),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.credit_card, color: AppColors.c929292,),
                  const SizedBox(width: 13),
                  Text('To’lov turi', style: Theme.of(context).textTheme.labelLarge,)

                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, indent: 40,),
              const SizedBox(height: 10),
              Row(
                children: [
                  AppImages.promocast,
                  const SizedBox(width: 13),
                  Text('Promoaksiyalar', style: Theme.of(context).textTheme.labelLarge,),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, indent: 40,),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.access_time, color: AppColors.c929292,),
                  const SizedBox(width: 13),
                  Text('Yo’nalishlar tarixi', style: Theme.of(context).textTheme.labelLarge,)

                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, indent: 40,),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.language, color: AppColors.c929292,),
                  const SizedBox(width: 13),
                  Text('Til', style: Theme.of(context).textTheme.labelLarge,),
                  const SizedBox(width: 170),
                   Text('O\'zbek', textAlign: TextAlign.end, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.c9DA4B1),)
                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, indent: 40,),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.error_outline, color: AppColors.c929292,),
                  const SizedBox(width: 13),
                  Text('Yordam', style: Theme.of(context).textTheme.labelLarge,)

                ],
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1, indent: 40,),
            ],
          ),
        ),
        const SizedBox(height: 200),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 40,
          padding: const  EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cF4F4F4,
          ),
          child: Row(
            children: [
             Expanded(
               child:  ElevatedButton(
                 onPressed: (){},
                 style: ElevatedButton.styleFrom(
                     backgroundColor: AppColors.white,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)
                     )
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Icon(CupertinoIcons.sun_min_fill, color: AppColors.black,),
                     const SizedBox(width: 4),
                     Text('Yorug‘', style: Theme.of(context).textTheme.labelLarge,)
                   ],
                 ),
               ),
             ),
              const SizedBox(width: 5),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.moon, color: AppColors.black, size: 20,),
                    const SizedBox(width: 4),
                    Text('To‘q', style: Theme.of(context).textTheme.labelLarge,)
                  ],
                ),
                // ElevatedButton(
                //   onPressed: (){},
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColors.white,
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20)
                //       )
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Icon(CupertinoIcons.moon, color: AppColors.black, size: 20,),
                //       const SizedBox(width: 4),
                //       Text('To‘q', style: Theme.of(context).textTheme.labelLarge,)
                //     ],
                //   ),
                // ),
              ),
            ],
          ),
        )

      ],
    );
  }
}
