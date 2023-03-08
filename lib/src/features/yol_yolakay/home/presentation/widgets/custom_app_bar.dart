import 'package:Chikki/src/core/style/colors.dart';
import 'package:Chikki/src/core/style/images.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomAppBar({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cEDEDF1,
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            IconButton(
              splashRadius: 25,
              onPressed: (){
                Navigator.of(context).pop();
              },
                icon: const Icon(Icons.arrow_back, color: AppColors.black,)),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Toshkent', style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),),
                    const SizedBox(width: 15,),
                    AppImages.resultArrow,
                    const SizedBox(width: 15,),
                    const Text('Samarqand', style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),),
                  ],
                ),
                const Text('сегодня, 1 пассажир', style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cA8A8A8,
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
