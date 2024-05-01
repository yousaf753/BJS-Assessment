import 'package:flutter/cupertino.dart';

import '../shared/resources/app_colors.dart';
import 'custom_text.dart';

Widget customInfoViewField({required String title,required String info}) {
 return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      customText(
        text: title,
        textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor),
      ),
      Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteColor
        ),
        child: customText(text: info, textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: AppColors.blackColor),
        textAlign: TextAlign.start
        ),
      )
    ],
  );
}