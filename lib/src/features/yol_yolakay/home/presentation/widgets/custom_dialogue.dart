import 'package:demo1/src/core/style/colors.dart';
import 'package:demo1/src/core/style/images.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.only(top: 15),
        title: const Center(child: Text('Qayerga ketasiz?', style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.c228738,
        ),),),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 46,
                    width: 46,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: AppImages.profile,
                  ),
                  const SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Samandar', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),),
                      Text('Cobalt', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c838383,
                      ),),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 35,),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: AppImages.where,
                  ),
                  const SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Qayerdan', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c838383,
                          ),),
                          Text('Toshkent', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),),
                        ],
                      ),
                      const SizedBox(height: 17,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Qayerga', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c838383,
                          ),),
                          Text('Samarqand', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 35,),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  Column(
                    children: [
                      AppImages.schedule,
                      const SizedBox(height: 25,),
                      AppImages.time,
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Kun', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c838383,
                          ),),
                          Text('24.06.2022', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Vaqti', style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.c838383,
                          ),),
                          Text('22:00', style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 35,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Narxi', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c838383,
                      ),),
                      Text('100.000 so’m', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('O’rindiqlar', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.c838383,
                      ),),
                      Text('2', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.chat),
            onPressed: (){
                Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 30,),
          MaterialButton(
            height: 30,
            minWidth: 130,
            color: AppColors.c383E70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Ketish', style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}