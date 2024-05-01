import 'package:bjs_assessment/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/user_profile_provider.dart';
import '../../shared/resources/app_colors.dart';
import '../../shared/resources/assets_path.dart';
import '../../widget/custom_info_with_switch.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_info_view_field.dart';
import 'edit_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<UserProfileProvider>(
        builder: (context, userProfileProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: customText(
              text:"Profile",
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(AssetsPath.splashLogo),
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                customText(
                                    text: userProfileProvider.userProfileModel?.username ?? "",
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: AppColors.blackColor),
                                    textAlign: TextAlign.start),
                                customText(
                                    text: "Developer",
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color:
                                        AppColors.blackColor.withOpacity(0.5)),
                                    textAlign: TextAlign.start),
                                const SizedBox(height: 16,),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfile()));
                                    },
                                    child: customButton(text: "Edit Profile", isActive: true))
                              ],
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 30,),
                  customInfoViewField(title: 'Email', info: userProfileProvider.userProfileModel?.username ?? ""),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(child: customInfoViewField(title: 'Gender', info: userProfileProvider.userProfileModel?.gender ?? "")),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(child: customInfoViewField(title: 'Dob', info: userProfileProvider.userProfileModel?.dob ?? "")),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  customInfoWithSwitch(title: 'Account', info: 'Public', isActive: userProfileProvider.userProfileModel?.account ?? false, onChanged: (bool v) => userProfileProvider.setAccount()),
                  const SizedBox(
                    height: 16,
                  ),
                  customInfoWithSwitch(title: 'Notification', info: '' ,isActive: userProfileProvider.userProfileModel?.notification ?? false, onChanged: (bool v) => userProfileProvider.setNotification()),
                  const SizedBox(
                    height: 16,
                  ),
                  customInfoWithSwitch(title: 'Switch Theme', info: 'Dark Mode', isActive: userProfileProvider.userProfileModel?.theme ?? false, onChanged: (bool v) => userProfileProvider.setTheme()),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
