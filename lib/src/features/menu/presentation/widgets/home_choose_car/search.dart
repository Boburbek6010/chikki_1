import 'package:demo1/src/core/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 60),
      height: 48,
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.only(left: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.c9DA4B1,
              size: 20,
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: TextField(
              style: const TextStyle(
                  height: 0.9,
              ),
              decoration: InputDecoration(
                // hintText: 'Search',
                prefixIcon: const Icon(CupertinoIcons.search),
                fillColor: Colors.white,
                filled: true,
                focusColor: Colors.white,
                hoverColor: Colors.white,
               border: OutlineInputBorder(
                 borderSide: const BorderSide(color: Colors.white),
                 borderRadius: BorderRadius.circular(12),
               ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
