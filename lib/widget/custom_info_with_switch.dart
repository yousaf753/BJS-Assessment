import 'package:flutter/material.dart';

import '../shared/resources/app_colors.dart';
import 'custom_text.dart';

Widget customInfoWithSwitch({required String title,required String info,required bool isActive,required void Function(bool) onChanged}) {
  return Container(
    margin: const EdgeInsets.only(top: 5),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.whiteColor
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: customText(text: title, textStyle:  TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: AppColors.blackColor.withOpacity(0.5)),
              textAlign: TextAlign.start
          ),
        ),
        customText(text: info, textStyle:  TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 10,
            color: AppColors.blackColor.withOpacity(0.3)),
            textAlign: TextAlign.start
        ),
        Container(
          height: 20,
          padding: const EdgeInsets.only(left: 5),
          child: Switch(value: isActive,
              activeTrackColor: AppColors.switchColor,
              inactiveTrackColor: AppColors.primaryColor,
              onChanged: onChanged),
        )
      ],
    ),
  );
}