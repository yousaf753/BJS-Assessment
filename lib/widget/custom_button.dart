import 'package:flutter/cupertino.dart';

import '../shared/resources/app_colors.dart';
import 'custom_text.dart';

Widget customButton({required String text, required bool isActive}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isActive ? AppColors.buttonColor : AppColors.primaryColor,
        border: Border.all(width: 1, color: AppColors.buttonColor)),
    child: customText(
        text: text,
        textStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? AppColors.whiteColor : AppColors.buttonColor),
        textAlign: TextAlign.center),
  );
}
