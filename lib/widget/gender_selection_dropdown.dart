import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/user_profile_provider.dart';
import '../shared/resources/app_colors.dart';
import 'custom_text.dart';

class GenderSelectionDropdown extends StatefulWidget {
  const GenderSelectionDropdown({super.key});

  @override
  State<GenderSelectionDropdown> createState() =>
      _GenderSelectionDropdownState();
}

class _GenderSelectionDropdownState extends State<GenderSelectionDropdown> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          customText(
            text: "Gender",
            textStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.whiteColor),
            child: DropdownButton<String>(
              underline: const SizedBox.shrink(),
              isDense: true,
              isExpanded: true,
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
              dropdownColor: AppColors.whiteColor,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: AppColors.blackColor),
              onChanged: (newValue) =>
                  userProfileProvider.setGender(value: newValue ?? "Male"),
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: customText(
                  text: userProfileProvider.userProfileModel?.gender ?? "Male",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: AppColors.blackColor.withOpacity(0.5)),
                  textAlign: TextAlign.start),
            ),
          ),
        ],
      );
    });
  }
}
